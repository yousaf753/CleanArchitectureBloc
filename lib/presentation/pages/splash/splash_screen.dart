import 'package:clean_arch_cubit/config/routes/routes.dart';
import 'package:clean_arch_cubit/domain/usecase/splash/splash_cubit.dart';
import 'package:clean_arch_cubit/res/app_colors.dart';
import 'package:clean_arch_cubit/res/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  /// For Cubit we dont actually need Events, only State is required
  /// Cubit is a part of BLOC
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state == SplashState.moveToHome) {
              GoRouter.of(context).pushReplacementNamed(Routes.kHome);
            } else if (state == SplashState.moveToLogin) {
              GoRouter.of(context).pushReplacementNamed(Routes.kLogin);
            }
          },
          builder: (context, state) {
            return Center(
              child: Text(
                "Clean Architecture",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.colorSecondaryText1,
                      fontSize: AppFontSize.textLarge,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
