import 'package:clean_arch_cubit/config/network/api_service.dart';
import 'package:clean_arch_cubit/config/network/network_constants.dart';
import 'package:clean_arch_cubit/config/network/resource.dart';
import 'package:clean_arch_cubit/config/network/status.dart';
import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data.dart';
import 'package:clean_arch_cubit/data/model/remote/auth/login_response.dart';
import 'package:clean_arch_cubit/domain/repo/auth_repo.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRepoImpl extends AuthRepo {

  AuthRepoImpl._();

  static AuthRepoImpl? _instance;

  static AuthRepoImpl getInstance() {
    _instance ??= AuthRepoImpl._();
    return _instance!;
  }

  final ApiService _apiService = getIt<ApiService>();
  final AppLocalData _localData = getIt<AppLocalData>();

  @override
  Future postLogin({requestData}) async {
    try {
      LoginResponse? response;
      dynamic data = _apiService.postRequest(
          url: "${dotenv.get(NetworkConstants.baseUrl)}${NetworkConstants.endPointLogin}",
          data: requestData,
          withToken: false // because we are not sending a default token in this api
          );
      Resource resource = await data;
      if (resource.status == STATUS.SUCCESS) {
        response = LoginResponse.fromJson(resource.data);
        return response;
      } else {
        debugPrint("UNSUCCESSFUL DUE TO >> ${resource.message ?? ""}");
      }
      return data;
    } catch (e) {
      debugPrint("EXCEPTION DUE TO >> Something went wrong, Please try again!");
      rethrow;
    }
  }

  @override
  Future clearAllData() {
    return _localData.clearAllData();
  }

  @override
  void setToken(String value) {
    _localData.setToken(value);
  }

  @override
  Future<String> getToken() async {
    return await (_localData.getToken());
  }
}
