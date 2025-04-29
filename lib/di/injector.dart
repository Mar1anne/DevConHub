import 'package:devcon_hub/features/agenda/di/di.dart';
import 'package:devcon_hub/features/speakers/di/di.dart';

void setupInjector() {
  AgendaInjector.initialize();
  SpeakersInjector.initialize();
}
