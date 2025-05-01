import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';

class FirebaseSpeakerDataSource {
  final FirebaseFirestore _firestore;

  FirebaseSpeakerDataSource(this._firestore);

  Future<List<SpeakerResponse>> fetchSpeakers() async {
    final snapshot = await _firestore.collection('speakers').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return SpeakerResponse.fromJson({
        'id': doc.id,
        ...data,
      });
    }).toList();
  }
}
