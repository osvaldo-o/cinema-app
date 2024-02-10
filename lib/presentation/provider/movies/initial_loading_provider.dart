import 'package:cinemapedia/presentation/provider/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.read(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.read(popularMovieProvider).isEmpty;
  final step3 = ref.read(upcomingMovieProvider).isEmpty;
  final step4 = ref.read(topRatedMoviesProvider).isEmpty;
  if (step1 || step2 || step3 || step4) return false;
  return true;
});
