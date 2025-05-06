import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/resources/data/models/resource_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResourceResponse', () {
    test('fromJson creates valid ResourceResponse', () {
      final json = {
        'id': '123',
        'name': 'Resource Title',
        'description': 'Resource Description',
        'url': 'https://example.com/resource',
        'type': 'talk',
        'imageUrl': 'https://example.com/image',
      };

      final response = ResourceResponse.fromJson(json);

      expect(response.id, '123');
      expect(response.name, 'Resource Title');
      expect(response.description, 'Resource Description');
      expect(response.url, 'https://example.com/resource');
      expect(response.imageUrl, 'https://example.com/image');
    });

    test('toEntity converts to Resource correctly', () {
      final response = ResourceResponse(
        id: '123',
        name: 'Resource Title',
        description: 'Resource Description',
        url: 'https://example.com/resource',
      );

      final entity = response.toEntity();

      expect(entity.id, '123');
      expect(entity.name, 'Resource Title');
    });

    test('fromJson handles null optional fields correctly', () {
      final json = {
        'id': '456',
        'name': null,
        'description': null,
        'url': null,
        'imageUrl': null,
      };
      final response = ResourceResponse.fromJson(json);
      expect(response.id, '456');
      expect(response.name, null);
      expect(response.description, null);
      expect(response.url, null);
      expect(response.imageUrl, null);
    });
  });
}
