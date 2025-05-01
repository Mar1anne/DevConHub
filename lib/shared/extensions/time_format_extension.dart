import 'package:intl/intl.dart';

extension TimeFormat on DateTime {
  get hMM => DateFormat('h.mm').format(this);

  get amPm => DateFormat('a').format(this);
}
