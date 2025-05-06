import 'package:cloud_firestore/cloud_firestore.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class FirebaseGenericDataSource {
  final FirebaseFirestore _firestore;

  FirebaseGenericDataSource(this._firestore);

  Future<List<T>> fetchCollection<T>({
    required String collectionName,
    required FromJson<T> fromJson,
  }) async {
    final snapshot = await _firestore.collection(collectionName).get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return fromJson({'id': doc.id, ...data});
    }).toList();
  }
}
