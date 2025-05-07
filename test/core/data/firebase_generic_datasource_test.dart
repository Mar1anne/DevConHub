import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore_for_file: subtype_of_sealed_class

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock implements QuerySnapshot<Map<String, dynamic>> {}

class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {}

void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference mockCollection;
  late MockQuerySnapshot mockSnapshot;
  late MockQueryDocumentSnapshot mockDoc;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference();
    mockSnapshot = MockQuerySnapshot();
    mockDoc = MockQueryDocumentSnapshot();

    when(() => mockFirestore.collection(any())).thenReturn(mockCollection);
  });

  test('fetchAll returns parsed list from Firestore', () async {
    const testId = 'abc123';
    final testData = {'name': 'Test Item'};

    when(() => mockCollection.get()).thenAnswer((_) async => mockSnapshot);

    when(() => mockSnapshot.docs).thenReturn([mockDoc]);

    when(() => mockDoc.id).thenReturn(testId);
    when(() => mockDoc.data()).thenReturn(testData);

    final datasource = FirebaseGenericDatasource<Map<String, dynamic>>(
      firestore: mockFirestore,
      collectionPath: 'testCollection',
      fromJson: (json, id) => {'id': id, ...json},
    );

    final result = await datasource.fetchAll();

    expect(result, [
      {'id': 'abc123', 'name': 'Test Item'}
    ]);
  });
}
