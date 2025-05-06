import 'package:devcon_hub/features/speakers/data/datasources/speaker_datasource.dart';
import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/features/speakers/domain/repositories/speaker_repository.dart';

class SpeakerRepositoryImpl implements SpeakerRepository {
  final SpeakersDataSource _dataSource;

  SpeakerRepositoryImpl(this._dataSource);

  @override
  Future<List<Speaker>> getSpeakers() async {
    final speakers = await _dataSource.fetchSpeakers();
    return speakers.map((e) => e.toEntity()).toList();
  }
}
