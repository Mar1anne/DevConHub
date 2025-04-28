import 'package:devcon_hub/features/landing/presentation/view/landing_page.dart';
import 'package:go_router/go_router.dart';

class LandingRoute {
  static const path = '/';

  static GoRoute route = GoRoute(
    path: path,
    builder: (context, state) => const LandingPage(),
  );
}
