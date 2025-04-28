import 'package:devcon_hub/features/home/presentation/view/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text('DevCon App'),
      ),
      body: const Center(
        child: Text('Main Content Goes Here'),
      ),
    );
  }
}
