extension NullableStringExtension on String? {
  /// Returns an empty string if the original string is null.
  String get emptyIfNull => this ?? '';

  /// Returns true if the string is not null and not empty.
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}
