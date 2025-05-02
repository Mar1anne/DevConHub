import 'package:devcon_hub/features/resources/domain/entities/resource.dart';

class ResourceResponse {
  String id;
  String? name;
  String? description;
  String? url;
  String? imageUrl;

  ResourceResponse({
    required this.id,
    this.name,
    this.description,
    this.url,
    this.imageUrl,
  });

  factory ResourceResponse.fromJson(Map<String, dynamic> json) {
    return ResourceResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}

extension ResourceMapper on ResourceResponse {
  Resource toEntity() {
    return Resource(
      id: id,
      name: name ?? '',
      description: description ?? '',
      url: url ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
