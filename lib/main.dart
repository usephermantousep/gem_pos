import 'package:flutter/material.dart';
import 'package:gem_pos/app.dart';
import 'package:gem_pos/dependecy_injection.dart';
import 'package:get_it/get_it.dart';

void main() {
  DependencyInjection(GetIt.instance);
  runApp(const MyApp());
}
