import 'package:devcon_hub/features/resources/data/models/resource_response.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseResourceDatasource {
  final FirebaseDatabase _database;
  FirebaseResourceDatasource(this._database);

  Future<List<ResourceResponse>> fetchResources() async {
    final ref = _database.ref('resources');
    final snapshot = await ref.get();
    if (!snapshot.exists) return [];

    final data = Map<String, dynamic>.from(snapshot.value as Map);
    return data.entries.map((entry) {
      final item = Map<String, dynamic>.from(entry.value);
      return ResourceResponse.fromJson(item);
    }).toList();
  }
}
