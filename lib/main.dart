import 'package:devcon_hub/di/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupInjector();
  runApp(const MyApp());
}
