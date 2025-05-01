import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/speakers/data/models/speaker_response.dart';

/// DTO (Data Transfer Object) for AgendaItem.
class AgendaItemResponse {
  final String id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String type;
  final SpeakerResponse? speaker;
  final DateTime startTime;
  final DateTime endTime;

  AgendaItemResponse({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.type,
    required this.speaker,
    required this.startTime,
    required this.endTime,
  });

  factory AgendaItemResponse.fromJson(Map<String, dynamic> json) {
    return AgendaItemResponse(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      type: json['type'],
      speaker: SpeakerResponse.fromJson(json['speaker']),
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
    );
  }
}

extension AgendaResponseMapper on AgendaItemResponse {
  AgendaItem toEntity() {
    return AgendaItem(
      id: id,
      title: title,
      subtitle: subtitle,
      description: description,
      type: type,
      speaker: speaker?.toEntity(),
      startTime: startTime,
      endTime: endTime,
    );
  }
}
