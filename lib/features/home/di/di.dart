import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/cache/generic_cache.dart';
import 'package:devcon_hub/core/cache/in_memory_cache.dart';
import 'package:devcon_hub/features/home/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/home/data/repositories/agenda_repository_impl.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/home/domain/repositories/agenda_repository.dart';
import 'package:devcon_hub/features/home/domain/usecases/get_agenda.dart';
import 'package:get_it/get_it.dart';

class AgendaInjector {
  static void initialize(GetIt injector) {
    injector
      ..registerLazySingleton<AgendaDataSource>(
        () => AgendaDataSource(FirebaseFirestore.instance),
      )
      ..registerLazySingleton<GenericCache<AgendaItem>>(
        () => InMemoryCache<AgendaItem>(),
      )
      ..registerLazySingleton<AgendaRepository>(
        () => AgendaRepositoryImpl(
            injector<AgendaDataSource>(), injector<GenericCache<AgendaItem>>()),
      )
      ..registerLazySingleton(
        () => GetAgendaUseCase(injector<AgendaRepository>()),
      );
  }
}
