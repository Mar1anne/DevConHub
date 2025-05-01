import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/shared/extensions/nullable_string_extension.dart';
import 'package:devcon_hub/shared/extensions/time_format_extension.dart';
import 'package:flutter/material.dart';

class AgendaItemCard extends StatefulWidget {
  final AgendaItem item;

  const AgendaItemCard({super.key, required this.item});

  @override
  State<AgendaItemCard> createState() => _AgendaItemCardState();
}

class _AgendaItemCardState extends State<AgendaItemCard> with TickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _iconController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() => _expanded = !_expanded);
    _expanded ? _iconController.forward() : _iconController.reverse();
  }

  String _formatAgendaTime(DateTime startTime, DateTime endTime) {
    return '${startTime.hMM} - ${endTime.hMM} ${endTime.amPm}';
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: _toggleExpand,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT side
            Column(
              children: [
                SizedBox(height: 16),
                Container(
                  width: 90,
                  color: Colors.pink.shade300,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    _formatAgendaTime(item.startTime!, item.endTime!),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // RIGHT side
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title.emptyIfNull,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(item.imageUrl!),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.subtitle.emptyIfNull,
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: ConstrainedBox(
                        constraints:
                            _expanded ? const BoxConstraints() : const BoxConstraints(maxHeight: 0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(item.description ?? ''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
