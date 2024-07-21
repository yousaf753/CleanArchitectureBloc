import 'package:clean_arch_cubit/config/network/api_service.dart';
import 'package:clean_arch_cubit/config/network/network_constants.dart';
import 'package:clean_arch_cubit/config/network/resource.dart';
import 'package:clean_arch_cubit/config/network/status.dart';
import 'package:clean_arch_cubit/data/dataSources/appLocalData/app_local_data.dart';
import 'package:clean_arch_cubit/data/model/remote/user/all_user_response.dart';
import 'package:clean_arch_cubit/domain/repo/user_repo.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepoImpl extends UserRepo{

  UserRepoImpl._();

  static UserRepoImpl? _instance;

  static UserRepoImpl getInstance() {
    _instance ??= UserRepoImpl._();
    return _instance!;
  }

  final ApiService _apiService = getIt<ApiService>();
  final AppLocalData _localData = getIt<AppLocalData>();

  @override
  Future clearAllData() {
    return _localData.clearAllData();
  }

  @override
  Future getAllUsers({requestData}) async{
    try {
      AllUserResponse? response;
      dynamic data = _apiService.getRequest(
          url: "${dotenv.get(NetworkConstants.baseUrl)}${NetworkConstants.endPointUser}",
          queryParameters: requestData,
          withToken: false // because we are not sending a default token in this api
      );
      Resource resource = await data;
      if (resource.status == STATUS.SUCCESS) {
        response = AllUserResponse.fromJson(resource.data);
        /*if (response.success ?? false) {
          return response;
        } else {
          if (Get.context != null) {
            CommonUtils().snackbarMessage(response.message ?? "", Get.context!);
          }
        }*/
        ////Use above if you follow the format shared in README file
        ////For this example return following
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

}