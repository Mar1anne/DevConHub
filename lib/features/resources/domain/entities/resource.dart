class Resource {
  final String id;
  final String? name;
  final String? description;
  final String? url;
  final String? imageUrl;

  Resource({
    required this.id,
    this.name,
    this.description,
    this.url,
    this.imageUrl,
  });
}
