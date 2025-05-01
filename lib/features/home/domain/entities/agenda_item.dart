class AgendaItem {
  final String id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? imageUrl;
  final DateTime? startTime;
  final DateTime? endTime;
  final String type;

  const AgendaItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.startTime,
    required this.endTime,
    required this.type,
  });
}
