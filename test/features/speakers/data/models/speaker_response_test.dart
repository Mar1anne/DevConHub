import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SpeakerResponse', () {
    test('fromJson creates valid SpeakerResponse', () {
      final json = {
        'id': '123',
        'name': 'John Doe',
        'bio': 'Software Engineer',
        'company': 'Tech Company',
        'imageUrl': 'https://example.com/image.png',
        'jobTitle': 'developer',
      };

      final response = SpeakerResponse.fromJson(json);

      expect(response.id, '123');
      expect(response.name, 'John Doe');
      expect(response.bio, 'Software Engineer');
      expect(response.company, 'Tech Company');
      expect(response.imageUrl, 'https://example.com/image.png');
      expect(response.jobTitle, 'developer');
    });

    test('toEntity converts to Speaker correctly', () {
      final response = SpeakerResponse(
        id: '123',
        name: 'John Doe',
        bio: 'Software Engineer',
        company: 'Tech Company',
        imageUrl: 'https://example.com/image.png',
        jobTitle: 'developer',
      );

      final entity = response.toEntity();

      expect(entity.id, '123');
      expect(entity.name, 'John Doe');
    });

    test('fromJson handles null optional fields correctly', () {
      final json = {
        'id': '456',
        'name': 'test',
        'bio': null,
        'company': null,
        'imageUrl': null,
        'jobTitle': null,
      };

      final response = SpeakerResponse.fromJson(json);

      expect(response.id, '456');
      expect(response.name, 'test');
      expect(response.bio, null);
      expect(response.company, null);
      expect(response.imageUrl, null);
      expect(response.jobTitle, null);
    });
  });
}
