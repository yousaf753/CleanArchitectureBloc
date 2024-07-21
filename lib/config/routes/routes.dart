import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:clean_arch_cubit/domain/usecase/home/home_cubit.dart';
import 'package:clean_arch_cubit/domain/usecase/login/login_cubit.dart';
import 'package:clean_arch_cubit/domain/usecase/splash/splash_cubit.dart';
import 'package:clean_arch_cubit/presentation/home_screen.dart';
import 'package:clean_arch_cubit/presentation/login_screen.dart';
import 'package:clean_arch_cubit/presentation/splash_screen.dart';
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
        return BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen());
      },
    ),
    GoRoute(
      name: Routes.kHome,
      path: "/${Routes.kHome}",
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(create: (_) => getIt<HomeCubit>(),
        child: const HomeScreen(),
        );
      },
    ),
  ],
);