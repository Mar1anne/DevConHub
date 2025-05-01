import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/speakers/data/datasources/speaker_datasource.dart';
import 'package:devcon_hub/features/speakers/data/repositories/speaker_repository_impl.dart';
import 'package:devcon_hub/features/speakers/domain/repositories/speaker_repository.dart';
import 'package:devcon_hub/features/speakers/domain/usecases/get_speakers.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

class SpeakersInjector {
  static void initialize() {
    injector
      ..registerLazySingleton<FirebaseSpeakerDataSource>(
        () => FirebaseSpeakerDataSource(FirebaseFirestore.instance),
      )
      ..registerLazySingleton<SpeakerRepository>(
        () => SpeakerRepositoryImpl(injector<FirebaseSpeakerDataSource>()),
      )
      ..registerLazySingleton(
        () => GetSpeakersUseCase(injector<SpeakerRepository>()),
      );
  }
}
