part of 'login_cubit.dart';

class LoginState {
  Resource? onPassErrorResource;
  Resource? onUsernameErrorResource;
  Resource? onApiResource;
  Resource? onMoveToHome;

  LoginState({this.onPassErrorResource, this.onApiResource, this.onUsernameErrorResource,this.onMoveToHome});

  factory LoginState.initial(){
    return LoginState();
  }

  @override
  List<Object?> get props => [onPassErrorResource, onUsernameErrorResource, onApiResource];

  LoginState copyWith({Resource? onPassErrorResource, Resource? onUsernameErrorResource, Resource? onApiResource,Resource? onMoveToHome}) {
    return LoginState(
      onPassErrorResource: onPassErrorResource ?? this.onPassErrorResource,
      onUsernameErrorResource: onUsernameErrorResource ?? this.onUsernameErrorResource,
      onApiResource: onApiResource ?? this.onApiResource,
      onMoveToHome: onMoveToHome ?? this.onMoveToHome,
    );
  }
}
