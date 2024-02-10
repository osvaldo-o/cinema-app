import 'package:cinemapedia/infrastructure/datasources/actors_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider =
    Provider((ref) => ActorRepositoryImpl(datasource: ActorsDatasourceImpl()));
