import 'package:devcon_hub/di/injector.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  setupInjector();
  runApp(const MyApp());
}
