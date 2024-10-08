import 'package:clean_arch_cubit/config/network/api_service.dart';
import 'package:clean_arch_cubit/config/network/api_service_impl.dart';
import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data.dart';
import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data_impl.dart';
import 'package:clean_arch_cubit/data/repo/auth_repo_impl.dart';
import 'package:clean_arch_cubit/data/repo/user_repo_impl.dart';
import 'package:clean_arch_cubit/domain/repo/auth_repo.dart';
import 'package:clean_arch_cubit/domain/repo/user_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register Single Responsible classes
  getIt.registerLazySingleton<AppLocalData>(() => AppLocalDataImpl.getInstance());
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl.getInstance());

  //Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl.getInstance());
  getIt.registerLazySingleton<UserRepo>(() => UserRepoImpl.getInstance());
}
