import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Schedule'),
            onTap: () {
              // Navigate to schedule page
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Speakers'),
            onTap: () {
              context.go('/speakers');
            },
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Resources'),
            onTap: () {
              // Navigate to resources page
            },
          ),
        ],
      ),
    );
  }
}
