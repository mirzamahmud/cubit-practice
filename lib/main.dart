import 'package:cubit_practice/core/di/dependency_injection.dart';
import 'package:cubit_practice/my_app.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await configureDependency();
  
  runApp(const MyApp());
}