import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/core/data/firebase_datasource.dart';
import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';

class SpeakersDataSource {
  final FirebaseGenericDatasource<SpeakerResponse> _datasource;

  SpeakersDataSource(FirebaseFirestore firestore)
      : _datasource = FirebaseGenericDatasource<SpeakerResponse>(
          firestore: firestore,
          collectionPath: 'speakers',
          fromJson: (json, id) => SpeakerResponse.fromJson({'id': id, ...json}),
        );

  Future<List<SpeakerResponse>> fetchSpeakers() {
    return _datasource.fetchAll();
  }
}
