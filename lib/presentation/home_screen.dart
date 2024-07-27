import 'package:clean_arch_cubit/config/network/status.dart';
import 'package:clean_arch_cubit/config/routes/routes.dart';
import 'package:clean_arch_cubit/domain/usecase/home/home_cubit.dart';
import 'package:clean_arch_cubit/presentation/customWidget/app_image.dart';
import 'package:clean_arch_cubit/presentation/customWidget/app_top_bar.dart';
import 'package:clean_arch_cubit/presentation/home_item.dart';
import 'package:clean_arch_cubit/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("IN PAGE >>>>>>>>>>>>>>>> HOME");
    //final homeCubit = getIt<HomeCubit>();
    final homeCubit = BlocProvider.of<HomeCubit>(context);


    return SafeArea(
      child: Scaffold(
          appBar: AppTopBar(
            isBackArrow: false,
            title: "Home",
            action: [
              IconButton(
                icon: const AppImage(
                  name: AppImage.iconLogout,
                  color: AppColors.colorWhite,
                ),
                onPressed: () {
                  homeCubit.onLogout();
                },
              ),
            ],
          ),
          body: BlocConsumer<HomeCubit, HomeState>(
            builder: (context, state) {
              return (state.onApiResource != null && state.onApiResource!.status == STATUS.LOADING)
                  ? const Center(child: CircularProgressIndicator())
                  : (state.onApiResource != null && state.onApiResource!.status == STATUS.SUCCESS)
                      ? Column(
                          children: [
                            for (var items in homeCubit.getUserList) ...[
                              HomeItem(
                                name: "${items.firstName} ${items.lastName}",
                                email: items.email,
                              ),
                            ]
                          ],
                        )
                      : const SizedBox();
            },
            listener: (context, state) {
              if(state.onMoveToLogin != null ){
                GoRouter.of(context).pushReplacementNamed(Routes.kLogin);
              }
            },
          )

          /*BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return (state.onApiResource != null && state.onApiResource!.status == STATUS.LOADING)
                ? const Center(child: CircularProgressIndicator())
                : (state.onApiResource != null && state.onApiResource!.status == STATUS.SUCCESS)
                    ? Column(
                        children: [
                          for (var items in homeCubit.getUserList) ...[
                            HomeItem(
                              name: "${items.firstName} ${items.lastName}",
                              email: items.email,
                            ),
                          ]
                        ],
                      )
                    : const SizedBox();
            //GoRouter.of(context).pushReplacementNamed(Routes.kLogin);
          },
        ),*/
          ),
    );
  }
}
