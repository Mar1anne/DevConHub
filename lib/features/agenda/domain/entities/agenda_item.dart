import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';

class AgendaItem {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final Speaker speaker;
  final String type;

  const AgendaItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.speaker,
    required this.type,
  });
}
