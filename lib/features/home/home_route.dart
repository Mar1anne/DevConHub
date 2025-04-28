import 'package:devcon_hub/features/home/presentation/view/home_page.dart';
import 'package:go_router/go_router.dart';

class HomeRoute {
  static const path = '/home';

  static GoRoute route = GoRoute(
    path: path,
    builder: (context, state) => const HomePage(),
  );
}
