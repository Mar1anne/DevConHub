import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';

class SpeakerResponse {
  final String id;
  final String? name;
  final String? imageUrl;
  final String? bio;
  final String? company;
  final String? jobTitle;

  SpeakerResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.company,
    required this.jobTitle,
  });

  factory SpeakerResponse.fromJson(Map<String, dynamic> json) {
    return SpeakerResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      bio: json['bio'] as String?,
      company: json['company'] as String?,
      jobTitle: json['jobTitle'] as String?,
    );
  }

  Speaker toEntity() {
    return Speaker(
      id: id,
      name: name,
      imageUrl: imageUrl,
      bio: bio,
      company: company,
      jobTitle: jobTitle,
    );
  }
}
