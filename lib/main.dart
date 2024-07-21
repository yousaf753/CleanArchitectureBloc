import 'package:clean_arch_cubit/config/config.dart';
import 'package:clean_arch_cubit/config/routes/routes.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: Config.dev);

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
    );
  }
}
