import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';

/// DTO (Data Transfer Object) for AgendaItem.
class AgendaItemResponse {
  final String id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? imageUrl;
  final String type;
  final DateTime startTime;
  final DateTime endTime;

  AgendaItemResponse({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.startTime,
    required this.endTime,
  });

  factory AgendaItemResponse.fromJson(Map<String, dynamic> json) {
    return AgendaItemResponse(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      type: json['type'],
      startTime: (json['startTime'] as Timestamp).toDate(),
      endTime: (json['endTime'] as Timestamp).toDate(),
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
      imageUrl: imageUrl,
      type: type,
      startTime: startTime,
      endTime: endTime,
    );
  }
}
