import 'package:bloc/bloc.dart';
import 'package:clean_arch_cubit/config/network/network_constants.dart';
import 'package:clean_arch_cubit/config/network/resource.dart';
import 'package:clean_arch_cubit/config/network/status.dart';
import 'package:clean_arch_cubit/data/model/remote/user/all_user_response.dart';
import 'package:clean_arch_cubit/domain/repo/user_repo.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  final _authRepo = getIt<UserRepo>();

  final List<Data> _userList = [];

  List<Data> get getUserList => _userList;

  HomeCubit():super(HomeState.initial()){
    _callHomeApi();
  }


  onLogout() async{
    await _authRepo.clearAllData();
    emit(state.copyWith(onMoveToLogin: Resource()));
    //_authRepo.clearAllData().then((value) => emit(state.copyWith(onMoveToLogin: Resource())));
  }


  void _callHomeApi() {
    ////// Request Data
    Map<String, dynamic> data1 = {
      NetworkConstants.paramPage: "1",
    };
    //////

    ////// Any of data1 or data2 can be used
    emit(state.copyWith(onApiResource: Resource(status: STATUS.LOADING)));
    _authRepo.getAllUsers(requestData: data1).then((value) {
      emit(state.copyWith(onApiResource: Resource(status: STATUS.SUCCESS)));
      AllUserResponse? response = value;
      if (response != null) {
        var listUser = response.data ?? [];
        _userList.addAll(listUser);
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(onApiResource: Resource(status: STATUS.ERROR)));
    });
    //////
  }
}