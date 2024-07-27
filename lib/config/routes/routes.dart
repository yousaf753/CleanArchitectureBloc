import 'package:clean_arch_cubit/domain/usecase/home/home_cubit.dart';
import 'package:clean_arch_cubit/domain/usecase/login/login_cubit.dart';
import 'package:clean_arch_cubit/domain/usecase/splash/splash_cubit.dart';
import 'package:clean_arch_cubit/presentation/pages/home/home_screen.dart';
import 'package:clean_arch_cubit/presentation/pages/login/login_screen.dart';
import 'package:clean_arch_cubit/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String kSplash = 'splash';
  static String kHome = 'home';
  static String kLogin = 'login';
}

final GoRouter appRoutes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: Routes.kSplash,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (_) => SplashCubit(),
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      name: Routes.kLogin,
      path: "/${Routes.kLogin}",
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider( //when you use a bloc or cubit its important to use a a  blocProvider
            create: (_) => LoginCubit(),
            child: const LoginScreen());
      },
    ),
    GoRoute(
      name: Routes.kHome,
      path: "/${Routes.kHome}",
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(create: (_) => HomeCubit(),
        child: const HomeScreen(),
        );
      },
    ),
  ],
);