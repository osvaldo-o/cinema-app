import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/provider/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsProvider =
    StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {
  final getActors = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return ActorsNotifier(getActors);
});

typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActors;

  ActorsNotifier(this.getActors) : super({});

  Future loadActor(String movieId) async {
    if (state[movieId] != null) return;
    state = {...state, movieId: await getActors(movieId)};
  }
}
