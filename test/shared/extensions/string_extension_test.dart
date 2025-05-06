import 'package:devcon_hub/shared/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtension.capitalize', () {
    test('capitalizes the first letter of a lowercase word', () {
      const input = 'hello';
      expect(input.capitalize(), 'Hello');
    });

    test('returns the same string if already capitalized', () {
      const input = 'World';
      expect(input.capitalize(), 'World');
    });

    test('capitalizes only the first letter, leaves the rest as-is', () {
      const input = 'fLUTTER';
      expect(input.capitalize(), 'FLUTTER');
    });

    test('returns empty string if input is empty', () {
      const input = '';
      expect(input.capitalize(), '');
    });

    test('handles single character string correctly', () {
      const input = 'a';
      expect(input.capitalize(), 'A');
    });
  });
}
