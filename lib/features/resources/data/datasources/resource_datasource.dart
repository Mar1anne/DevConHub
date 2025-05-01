import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/resources/data/models/resource_response.dart';

class FirebaseResourceDatasource {
  final FirebaseFirestore _firestore;

  FirebaseResourceDatasource(this._firestore);

  Future<List<ResourceResponse>> fetchResources() async {
    final snapshot = await _firestore.collection('resources').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return ResourceResponse.fromJson({
        'id': doc.id,
        ...data,
      });
    }).toList();
  }
}
