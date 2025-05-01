import 'package:devcon_hub/features/home/presentation/view/drawer_menu.dart';
import 'package:devcon_hub/features/home/presentation/view/drawer_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      body: const Center(
        child: Text('Main Content Goes Here'),
      ),
      title: 'DevCon App',
    );
  }
}
