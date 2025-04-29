import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseSpeakerDataSource {
  final FirebaseDatabase _database;
  FirebaseSpeakerDataSource(this._database);

  Future<List<SpeakerResponse>> fetchSpeakers() async {
    final ref = _database.ref('speakers');
    final snapshot = await ref.get();
    if (!snapshot.exists) return [];

    final data = Map<String, dynamic>.from(snapshot.value as Map);
    return data.entries.map((entry) {
      final item = Map<String, dynamic>.from(entry.value);
      return SpeakerResponse.fromJson(item);
    }).toList();
  }
}
