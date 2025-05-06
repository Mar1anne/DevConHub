import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:devcon_hub/features/resources/data/models/resource_response.dart';

class ResourcesDataSource {
  final FirebaseGenericDataSource _base;

  ResourcesDataSource(FirebaseFirestore firestore) : _base = FirebaseGenericDataSource(firestore);

  Future<List<ResourceResponse>> fetchResources() {
    return _base.fetchCollection<ResourceResponse>(
      collectionName: 'resources',
      fromJson: ResourceResponse.fromJson,
    );
  }
}
