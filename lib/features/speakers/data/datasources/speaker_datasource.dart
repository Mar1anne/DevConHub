import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';

class SpeakersDataSource {
  final FirebaseGenericDataSource _base;

  SpeakersDataSource(FirebaseFirestore firestore) : _base = FirebaseGenericDataSource(firestore);

  Future<List<SpeakerResponse>> fetchSpeakers() {
    return _base.fetchCollection<SpeakerResponse>(
      collectionName: 'speakers',
      fromJson: SpeakerResponse.fromJson,
    );
  }
}
