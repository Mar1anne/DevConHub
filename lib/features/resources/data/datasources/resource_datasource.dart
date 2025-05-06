import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:devcon_hub/features/resources/data/models/resource_response.dart';

class ResourcesDataSource {
  final FirebaseGenericDatasource<ResourceResponse> _datasource;

  ResourcesDataSource(FirebaseFirestore firestore)
      : _datasource = FirebaseGenericDatasource<ResourceResponse>(
          firestore: firestore,
          collectionPath: 'resources',
          fromJson: (json, id) => ResourceResponse.fromJson({'id': id, ...json}),
        );

  Future<List<ResourceResponse>> fetchResources() {
    return _datasource.fetchAll();
  }
}
