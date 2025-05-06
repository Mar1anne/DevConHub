import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';

class AgendaDataSource {
  final FirebaseGenericDatasource<AgendaItemResponse> _datasource;

  AgendaDataSource(FirebaseFirestore firestore)
      : _datasource = FirebaseGenericDatasource<AgendaItemResponse>(
          firestore: firestore,
          collectionPath: 'agenda',
          fromJson: (json, id) => AgendaItemResponse.fromJson({'id': id, ...json}),
        );

  Future<List<AgendaItemResponse>> fetchAgenda() {
    return _datasource.fetchAll();
  }
}
