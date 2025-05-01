import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';

class FirebaseAgendaDatasource {
  final FirebaseFirestore _firestore;

  FirebaseAgendaDatasource(this._firestore);

  Future<List<AgendaItemResponse>> fetchAgenda() async {
    final snapshot = await _firestore.collection('agenda').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return AgendaItemResponse.fromJson({
        'id': doc.id,
        ...data,
      });
    }).toList();
  }
}
