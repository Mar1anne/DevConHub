import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/shared/extensions/nullable_string_extension.dart';
import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  final Speaker speaker;

  const SpeakerCard({
    super.key,
    required this.speaker,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(speaker.imageUrl.emptyIfNull, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              speaker.name.emptyIfNull.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              '${speaker.jobTitle.emptyIfNull} @ ${speaker.company.emptyIfNull}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
