import 'package:devcon_hub/shared/extensions/time_format_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('TimeFormat Extension', () {
    test('hMM returns correct time format (e.g. 1.30)', () {
      final dateTime = DateTime(2024, 1, 1, 13, 30); // 1:30 PM
      expect(dateTime.hMM, DateFormat('h.mm').format(dateTime));
    });

    test('amPm returns AM or PM correctly', () {
      final morning = DateTime(2024, 1, 1, 9, 0); // 9:00 AM
      final evening = DateTime(2024, 1, 1, 21, 0); // 9:00 PM

      expect(morning.amPm, DateFormat('a').format(morning));
      expect(evening.amPm, DateFormat('a').format(evening));
    });
  });
}
