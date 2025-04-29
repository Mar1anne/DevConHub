import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/features/speakers/domain/repositories/speaker_repository.dart';

class GetSpeakers {
  final SpeakerRepository repository;

  GetSpeakers(this.repository);

  Future<List<Speaker>> call() async {
    return await repository.getSpeakers();
  }
}
