import 'package:devcon_hub/features/resources/domain/entities/resource.dart';

class ResourceResponse {
  String id;
  String? title;
  String? description;
  String? url;

  ResourceResponse({
    required this.id,
    this.title,
    this.description,
    this.url,
  });

  factory ResourceResponse.fromJson(Map<String, dynamic> json) {
    return ResourceResponse(
      id: json['id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
    );
  }
}

extension ResourceMapper on ResourceResponse {
  Resource toEntity() {
    return Resource(
      id: id,
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
    );
  }
}
