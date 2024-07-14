import 'package:clean_arch_cubit/config/network/api_service.dart';
import 'package:clean_arch_cubit/config/network/api_service_impl.dart';
import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data.dart';
import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data_impl.dart';
import 'package:clean_arch_cubit/data/repo/auth_repo_impl.dart';
import 'package:clean_arch_cubit/domain/repo/auth_repo.dart';
import 'package:clean_arch_cubit/domain/usecase/splash/splash_cubit.dart';
import 'package:get_it/get_it.dart';


  /*AppLocator._();

  static AppLocator? _instance;

  static AppLocator getInstance() {
    _instance ??= AppLocator._();
    return _instance!;
  }*/

  final getIt = GetIt.instance;

  void setupLocator() {
    // Register services
    getIt.registerLazySingleton<AppLocalData>(() => AppLocalDataImpl.getInstance());
    getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl.getInstance());

    //Repo
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl.getInstance());
    //getIt.registerFactory<SplashCubit>(() => SplashCubit());

    //BLOC and Cubit
    //getIt.registerFactory<SplashCubit>(() => SplashCubit());
    //getIt.registerLazySingleton<SplashCubit>(() => SplashCubit());

}
