import 'package:flutter/material.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DevCon App',
      theme: ThemeData.light(), // TODO: Implement dark mode
      routerConfig: router,
    );
  }
}
