import 'package:cinemapedia/config/constants/environmnet.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_detail.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDatasource extends MoviesDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environmnet.movieDBKey,
    'language': 'es-MX',
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return MovieDbResponse.fromJson(response.data)
        .results
        .where((moviedb) => moviedb.posterPath.isNotEmpty)
        .where((moviedb) => moviedb.backdropPath.isNotEmpty)
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return MovieDbResponse.fromJson(response.data)
        .results
        .where((moviedb) => moviedb.posterPath.isNotEmpty)
        .where((moviedb) => moviedb.backdropPath.isNotEmpty)
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return MovieDbResponse.fromJson(response.data)
        .results
        .where((moviedb) => moviedb.posterPath.isNotEmpty)
        .where((moviedb) => moviedb.backdropPath.isNotEmpty)
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return MovieDbResponse.fromJson(response.data)
        .results
        .where((moviedb) => moviedb.posterPath.isNotEmpty)
        .where((moviedb) => moviedb.backdropPath.isNotEmpty)
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }
    return MovieMapper.movieDetailsToEntity(
        MovieDetail.fromJson(response.data));
  }
}
