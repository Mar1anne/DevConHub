import 'package:devcon_hub/features/agenda/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/agenda/data/repositories/agenda_repository_impl.dart';
import 'package:devcon_hub/features/agenda/domain/repositories/agenda_repository.dart';
import 'package:devcon_hub/features/agenda/domain/usecases/get_agenda.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

class AgendaInjector {
  static void initialize() {
    injector
      // ..registerLazySingleton<FirebaseAgendaDatasource>(
      //   () => FirebaseAgendaDatasource(),
      // )
      ..registerLazySingleton<AgendaRepository>(
        () => AgendaRepositoryImpl(injector<FirebaseAgendaDatasource>()),
      )
      ..registerLazySingleton(
        () => GetAgenda(injector<AgendaRepository>()),
      );
  }
}
