import 'package:devcon_hub/features/home/presentation/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class HomeRoute {
  static const path = '/home';

  static GoRoute route = GoRoute(
      path: path,
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      });
}
