import 'package:devcon_hub/features/home/home_route.dart';
import 'package:devcon_hub/features/landing/landing_route.dart';
import 'package:devcon_hub/features/resources/resources_route.dart';
import 'package:devcon_hub/features/speakers/speakers_route.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: LandingRoute.path,
  routes: [
    LandingRoute.route,
    HomeRoute.route,
    SpeakersRoute.route,
    SpeakersRoute.speakerDetailsRoute,
    ResourcesRoute.route,
  ],
);
