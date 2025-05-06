import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';

class AgendaDataSource {
  final FirebaseGenericDataSource _base;

  AgendaDataSource(FirebaseFirestore firestore) : _base = FirebaseGenericDataSource(firestore);

  Future<List<AgendaItemResponse>> fetchAgenda() {
    return _base.fetchCollection<AgendaItemResponse>(
      collectionName: 'agenda',
      fromJson: AgendaItemResponse.fromJson,
    );
  }
}
