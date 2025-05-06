import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/home/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/home/data/repositories/agenda_repository_impl.dart';
import 'package:devcon_hub/features/home/domain/repositories/agenda_repository.dart';
import 'package:devcon_hub/features/home/domain/usecases/get_agenda.dart';
import 'package:get_it/get_it.dart';

class AgendaInjector {
  static void initialize(GetIt injector) {
    injector
      ..registerLazySingleton<AgendaDataSource>(
        () => AgendaDataSource(FirebaseFirestore.instance),
      )
      ..registerLazySingleton<AgendaRepository>(
        () => AgendaRepositoryImpl(injector<AgendaDataSource>()),
      )
      ..registerLazySingleton(
        () => GetAgendaUseCase(injector<AgendaRepository>()),
      );
  }
}
