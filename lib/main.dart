import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gempos/app.dart';
import 'package:gempos/core/di/dependency_injection.dart';
import 'package:get_it/get_it.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection(GetIt.I);
  runApp(const App());
}
