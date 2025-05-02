import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:devcon_hub/features/resources/presentation/view/resources_webview.dart';
import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;

  const ResourceCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          if (resource.url != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ResourceWebView(url: resource.url!, title: resource.name ?? 'Resource'),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              if (resource.imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    resource.imageUrl!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  resource.name ?? 'Untitled',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
