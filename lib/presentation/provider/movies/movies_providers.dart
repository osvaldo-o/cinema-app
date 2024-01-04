import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MovieNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MovieNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;
  MovieNotifier({required this.fetchMoreMovies}) : super([]);

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    state = [...state, ...await fetchMoreMovies(page: currentPage)];
    isLoading = false;
  }
}
