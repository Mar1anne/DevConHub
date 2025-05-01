import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: SvgPicture.asset(
                'lib/features/home/assets/images/logo_white.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Agenda'),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Speakers'),
            onTap: () => context.go('/speakers'),
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Resources'),
            onTap: () => context.go('/resources'),
          ),
        ],
      ),
    );
  }
}
