import 'package:devcon_hub/shared/extensions/nullable_string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NullableStringExtension', () {
    test('emptyIfNull returns original string if not null', () {
      const String value = 'Hello';
      expect(value.emptyIfNull, 'Hello');
    });

    test('emptyIfNull returns empty string if null', () {
      const String? value = null;
      expect(value.emptyIfNull, '');
    });

    test('isNotNullOrEmpty returns true for non-empty string', () {
      const String value = 'Test';
      expect(value.isNotNullOrEmpty, true);
    });

    test('isNotNullOrEmpty returns false for null string', () {
      const String? value = null;
      expect(value.isNotNullOrEmpty, false);
    });

    test('isNotNullOrEmpty returns false for empty string', () {
      const String value = '';
      expect(value.isNotNullOrEmpty, false);
    });
  });
}
