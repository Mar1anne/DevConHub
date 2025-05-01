import 'package:devcon_hub/features/home/presentation/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeRoute {
  static const path = '/home';

  static GoRoute route = GoRoute(
      path: path,
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) {
        final isFromLanding = state.extra == 'landing';

        // Use fade transition for landing page
        if (isFromLanding) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: const HomePage(),
          );
        }

        // Use default page with no custom transition
        return MaterialPage(child: const HomePage());
      });
}
