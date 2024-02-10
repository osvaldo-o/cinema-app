import 'package:cinemapedia/config/constants/environmnet.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorsDatasourceImpl extends ActorsDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environmnet.movieDBKey,
    'language': 'es-MX',
  }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return CreditsResponse.fromJson(response.data)
        .cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
  }
}
