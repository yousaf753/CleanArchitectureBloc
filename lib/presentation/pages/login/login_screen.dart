import 'package:clean_arch_cubit/config/network/status.dart';
import 'package:clean_arch_cubit/config/routes/routes.dart';
import 'package:clean_arch_cubit/domain/usecase/login/login_cubit.dart';
import 'package:clean_arch_cubit/presentation/customWidget/common_button.dart';
import 'package:clean_arch_cubit/presentation/customWidget/input_field.dart';
import 'package:clean_arch_cubit/res/app_colors.dart';
import 'package:clean_arch_cubit/res/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("IN PAGE >>>>>>>>>>>>>>>> LOGIN");

    //final loginCubit = getIt<LoginCubit>();
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.colorSecondaryText1,
                      fontSize: AppFontSize.textUltraLarge,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return InputField(
                    hintText: "Username",
                    errorText: (state.onUsernameErrorResource != null && state.onUsernameErrorResource!.message!.isNotEmpty)
                        ? state.onUsernameErrorResource!.message
                        : "",
                    controller: loginCubit.usernameController,
                    onChange: (value) {
                      loginCubit.getLoginData.setUsername(value);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return InputField(
                    hintText: "Password",
                    controller: loginCubit.passwordController,
                    errorText: (state.onPassErrorResource != null && state.onPassErrorResource!.message!.isNotEmpty)
                        ? state.onPassErrorResource!.message
                        : "",
                    onChange: (value) {
                      loginCubit.getLoginData.setPassword(value);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
                return CommonButton(
                  loading: (state.onApiResource != null && state.onApiResource!.status == STATUS.LOADING),
                  buttonText: "Submit",
                  onPressed: () {
                    loginCubit.onSubmit();
                  },
                );
              }, listener: (context, state) {
                if (state.onMoveToHome != null) {
                  GoRouter.of(context).pushReplacementNamed(Routes.kHome);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
