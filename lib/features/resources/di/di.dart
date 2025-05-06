import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/resources/data/datasources/resource_datasource.dart';
import 'package:devcon_hub/features/resources/data/repositories/resource_repository_impl.dart';
import 'package:devcon_hub/features/resources/domain/repositories/resource_repository.dart';
import 'package:devcon_hub/features/resources/domain/usecases/get_resources.dart';
import 'package:get_it/get_it.dart';

class ResourcesInjector {
  static void initialize(GetIt injector) {
    injector
      ..registerLazySingleton<FirebaseResourceDatasource>(
        () => FirebaseResourceDatasource(FirebaseFirestore.instance),
      )
      ..registerLazySingleton<ResourceRepository>(
        () => ResourceRepositoryImpl(injector<FirebaseResourceDatasource>()),
      )
      ..registerLazySingleton(
        () => GetResourcesUseCase(injector<ResourceRepository>()),
      );
  }
}
