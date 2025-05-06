import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseGenericDatasource<T> {
  final FirebaseFirestore firestore;
  final String collectionPath;
  final T Function(Map<String, dynamic> json, String id) fromJson;

  FirebaseGenericDatasource({
    required this.firestore,
    required this.collectionPath,
    required this.fromJson,
  });

  Future<List<T>> fetchAll() async {
    final snapshot = await firestore.collection(collectionPath).get();
    return snapshot.docs.map((doc) => fromJson(doc.data(), doc.id)).toList();
  }
}
