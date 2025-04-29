import 'package:devcon_hub/features/agenda/data/models/agenda_item_response.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAgendaDatasource {
  final FirebaseDatabase _db;

  FirebaseAgendaDatasource(this._db);

  Future<List<AgendaItemResponse>> fetchAgenda() async {
    final ref = _db.ref('agenda');
    final snapshot = await ref.get();
    if (!snapshot.exists) return [];

    final data = Map<String, dynamic>.from(snapshot.value as Map);
    return data.entries.map((entry) {
      final item = Map<String, dynamic>.from(entry.value);
      return AgendaItemResponse.fromJson(item);
    }).toList();
  }
}
