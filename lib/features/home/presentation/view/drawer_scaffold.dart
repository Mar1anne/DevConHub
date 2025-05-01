import 'package:devcon_hub/features/home/presentation/view/drawer_menu.dart';
import 'package:flutter/material.dart';

class DrawerScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const DrawerScaffold({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
