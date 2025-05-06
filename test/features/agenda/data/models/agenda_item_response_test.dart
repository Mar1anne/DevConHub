import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AgendaItemResponse', () {
    test('fromJson creates valid AgendaItemResponse', () {
      final json = {
        'id': '123',
        'title': 'Opening Keynote',
        'subtitle': 'Welcome message',
        'description': 'Kickoff for the conference',
        'imageUrl': 'https://example.com/image.png',
        'type': 'general',
        'startTime': Timestamp.fromDate(DateTime(2025, 5, 1, 9, 0)),
        'endTime': Timestamp.fromDate(DateTime(2025, 5, 1, 10, 0)),
      };

      final response = AgendaItemResponse.fromJson(json);

      expect(response.id, '123');
      expect(response.title, 'Opening Keynote');
      expect(response.startTime, DateTime(2025, 5, 1, 9, 0));
      expect(response.endTime, DateTime(2025, 5, 1, 10, 0));
    });

    test('toEntity converts to AgendaItem correctly', () {
      final response = AgendaItemResponse(
        id: '123',
        title: 'Opening Keynote',
        subtitle: 'Welcome message',
        description: 'Kickoff for the conference',
        imageUrl: 'https://example.com/image.png',
        type: 'general',
        startTime: DateTime(2025, 5, 1, 9, 0),
        endTime: DateTime(2025, 5, 1, 10, 0),
      );

      final entity = response.toEntity();

      expect(entity, isA<AgendaItem>());
      expect(entity.id, '123');
      expect(entity.title, 'Opening Keynote');
    });

    test('fromJson handles null optional fields correctly', () {
      final json = {
        'id': '456',
        'title': null,
        'subtitle': null,
        'description': null,
        'imageUrl': null,
        'type': 'talk',
        'startTime': Timestamp.fromDate(DateTime(2025, 5, 2, 14, 0)),
        'endTime': Timestamp.fromDate(DateTime(2025, 5, 2, 15, 0)),
      };

      final response = AgendaItemResponse.fromJson(json);

      expect(response.title, isNull);
      expect(response.subtitle, isNull);
      expect(response.description, isNull);
      expect(response.imageUrl, isNull);
      expect(response.type, 'talk');
    });

    test('fromJson throws if required Timestamp fields are missing or wrong type', () {
      final json = {
        'id': '789',
        'title': 'Invalid Time',
        'type': 'general',
        'startTime': 'not a timestamp',
        'endTime': Timestamp.fromDate(DateTime(2025, 5, 2, 15, 0)),
      };

      expect(() => AgendaItemResponse.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
