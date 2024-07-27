import 'package:clean_arch_cubit/config/config.dart';
import 'package:clean_arch_cubit/config/routes/routes.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  //Load initial environment
  await dotenv.load(fileName: Config.dev);

  //Set up dependencies
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(//.router used because  of GoRouter dependencies
      routerConfig: appRoutes,
    );
  }
}
