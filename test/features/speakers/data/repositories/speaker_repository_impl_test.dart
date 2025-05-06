import 'package:devcon_hub/features/speakers/data/datasources/speaker_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';
import 'package:devcon_hub/features/speakers/data/repositories/speaker_repository_impl.dart';
import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';

class MockSpeakersDataSource extends Mock implements SpeakersDataSource {}

void main() {
  late SpeakerRepositoryImpl repository;
  late MockSpeakersDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockSpeakersDataSource();
    repository = SpeakerRepositoryImpl(mockDataSource);
  });

  test('getSpeakers returns list of Speaker entities', () async {
    final speakerResponseList = [
      SpeakerResponse(
        id: '1',
        name: 'Jane Doe',
        imageUrl: 'http://example.com/jane.jpg',
        bio: 'Tech speaker',
        company: 'Tech Inc.',
        jobTitle: 'Engineer',
      ),
    ];

    when(() => mockDataSource.fetchSpeakers()).thenAnswer((_) async => speakerResponseList);

    final expected = [
      Speaker(
        id: '1',
        name: 'Jane Doe',
        imageUrl: 'http://example.com/jane.jpg',
        bio: 'Tech speaker',
        company: 'Tech Inc.',
        jobTitle: 'Engineer',
      ),
    ];

    final result = await repository.getSpeakers();

    expect(result.first.id, expected.first.id);
    expect(result.first.name, expected.first.name);
    expect(result.first.imageUrl, expected.first.imageUrl);
    expect(result.first.bio, expected.first.bio);
    expect(result.first.company, expected.first.company);
    expect(result.first.jobTitle, expected.first.jobTitle);

    verify(() => mockDataSource.fetchSpeakers()).called(1);
  });
}
