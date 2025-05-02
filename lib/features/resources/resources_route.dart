import 'package:devcon_hub/features/resources/presentation/view/resources_page.dart';
import 'package:go_router/go_router.dart';

class ResourcesRoute {
  static const String path = '/resources';

  static GoRoute route = GoRoute(
    path: path,
    builder: (context, state) => const ResourcesPage(),
  );
}
