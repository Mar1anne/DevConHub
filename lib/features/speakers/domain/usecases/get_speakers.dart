import 'package:devcon_hub/core/usecase/usecase.dart';
import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/features/speakers/domain/repositories/speaker_repository.dart';

class GetSpeakersUseCase extends UseCase<List<Speaker>, void> {
  final SpeakerRepository repository;

  GetSpeakersUseCase(this.repository);

  @override
  Future<List<Speaker>> call(void params) async {
    return await repository.getSpeakers();
  }
}
