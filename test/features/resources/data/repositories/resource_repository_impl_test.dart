import 'package:devcon_hub/features/resources/data/datasources/resource_datasource.dart';
import 'package:devcon_hub/features/resources/data/models/resource_response.dart';
import 'package:devcon_hub/features/resources/data/repositories/resource_repository_impl.dart';
import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockResourcesDataSource extends Mock implements ResourcesDataSource {}

void main() {
  late ResourceRepositoryImpl repository;
  late MockResourcesDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockResourcesDataSource();
    repository = ResourceRepositoryImpl(mockDataSource);
  });

  test('getResources returns list of Resource entities', () async {
    final resourceResponseList = [
      ResourceResponse(
        id: '1',
        name: 'Resource 1',
        url: 'http://example.com/resource1',
      ),
    ];

    when(() => mockDataSource.fetchResources()).thenAnswer((_) async => resourceResponseList);

    final expected = [
      Resource(
        id: '1',
        name: 'Resource 1',
        url: 'http://example.com/resource1',
      ),
    ];

    final result = await repository.getResources();

    expect(result.first.id, expected.first.id);
    expect(result.first.name, expected.first.name);
    expect(result.first.url, expected.first.url);

    verify(() => mockDataSource.fetchResources()).called(1);
  });
}
