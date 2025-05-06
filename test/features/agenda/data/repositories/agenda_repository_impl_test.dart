import 'package:devcon_hub/features/home/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';
import 'package:devcon_hub/features/home/data/repositories/agenda_repository_impl.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAgendaDataSource extends Mock implements AgendaDataSource {}

void main() {
  late AgendaRepositoryImpl repository;
  late MockAgendaDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAgendaDataSource();
    repository = AgendaRepositoryImpl(mockDataSource);
  });

  test('getAgenda returns list of Agenda entities', () async {
    final agendaResponseList = [
      AgendaItemResponse(
        id: '1',
        title: 'Keynote',
        startTime: DateTime.parse('2023-10-01T10:00:00Z'),
        endTime: DateTime.parse('2023-10-01T11:00:00Z'),
        description: 'Opening keynote',
        subtitle: 'subtitle',
        imageUrl: '',
        type: '',
      ),
    ];

    when(() => mockDataSource.fetchAgenda()).thenAnswer((_) async => agendaResponseList);

    final expected = [
      AgendaItem(
        id: '1',
        title: 'Keynote',
        startTime: DateTime.parse('2023-10-01T10:00:00Z'),
        endTime: DateTime.parse('2023-10-01T11:00:00Z'),
        description: 'Opening keynote',
        subtitle: 'subtitle',
        imageUrl: '',
        type: '',
      ),
    ];

    final result = await repository.getAgendaItems();

    expect(result.first.id, expected.first.id);
    expect(result.first.title, expected.first.title);
    expect(result.first.startTime, expected.first.startTime);
    expect(result.first.endTime, expected.first.endTime);
    expect(result.first.description, expected.first.description);

    verify(() => mockDataSource.fetchAgenda()).called(1);
  });
}
