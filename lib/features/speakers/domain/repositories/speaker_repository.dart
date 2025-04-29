import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';

abstract class SpeakerRepository {
  Future<List<Speaker>> getSpeakers();
}
