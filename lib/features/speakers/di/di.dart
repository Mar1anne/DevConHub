import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/speakers/data/datasources/speaker_datasource.dart';
import 'package:devcon_hub/features/speakers/data/repositories/speaker_repository_impl.dart';
import 'package:devcon_hub/features/speakers/domain/repositories/speaker_repository.dart';
import 'package:devcon_hub/features/speakers/domain/usecases/get_speakers.dart';
import 'package:get_it/get_it.dart';

class SpeakersInjector {
  static void initialize(GetIt injector) {
    injector
      ..registerLazySingleton<SpeakersDataSource>(
        () => SpeakersDataSource(FirebaseFirestore.instance),
      )
      ..registerLazySingleton<SpeakerRepository>(
        () => SpeakerRepositoryImpl(injector<SpeakersDataSource>()),
      )
      ..registerLazySingleton(
        () => GetSpeakersUseCase(injector<SpeakerRepository>()),
      );
  }
}
