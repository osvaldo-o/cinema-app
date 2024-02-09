import 'package:cinemapedia/presentation/screens.dart';
import 'package:cinemapedia/presentation/screens/movies/movie_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: '/movie/:movieId',
      name: MovieScreen.name,
      builder: (context, state) =>
          MovieScreen(movieId: state.pathParameters['movieId']!))
]);
