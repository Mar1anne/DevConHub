import 'package:devcon_hub/features/home/di/di.dart';
import 'package:devcon_hub/features/resources/di/di.dart';
import 'package:devcon_hub/features/speakers/di/di.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void setupInjector() {
  AgendaInjector.initialize(injector);
  SpeakersInjector.initialize(injector);
  ResourcesInjector.initialize(injector);
}
