import 'package:devcon_hub/features/home/di/di.dart';
import 'package:devcon_hub/features/resources/di/di.dart';
import 'package:devcon_hub/features/speakers/di/di.dart';

void setupInjector() {
  AgendaInjector.initialize();
  SpeakersInjector.initialize();
  ResourcesInjector.initialize();
}
