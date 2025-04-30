import 'package:devcon_hub/features/resources/data/datasources/resource_datasource.dart';
import 'package:devcon_hub/features/resources/data/repositories/resource_repository_impl.dart';
import 'package:devcon_hub/features/resources/domain/repositories/resource_repository.dart';
import 'package:devcon_hub/features/resources/domain/usecases/get_resources.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

class ResourcesInjector {
  static void initialize() {
    injector
      // ..registerLazySingleton<FirebaseResourcesDatasource>(
      //   () => FirebaseResourcesDatasource(),
      // )
      ..registerLazySingleton<ResourceRepository>(
        () => ResourceRepositoryImpl(injector<FirebaseResourceDatasource>()),
      )
      ..registerLazySingleton(
        () => GetResources(injector<ResourceRepository>()),
      );
  }
}
