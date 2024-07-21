part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Resource? onPassErrorResource;
  final Resource? onUsernameErrorResource;
  final Resource? onApiResource;
  final Resource? onMoveToHome;

  const LoginState({
    this.onPassErrorResource,
    this.onApiResource,
    this.onUsernameErrorResource,
    this.onMoveToHome,
  });

  factory LoginState.initial() {
    return const LoginState();
  }

  @override
  List<Object?> get props => [onPassErrorResource, onUsernameErrorResource, onApiResource, onMoveToHome];

  LoginState copyWith({
    Resource? onPassErrorResource,
    Resource? onUsernameErrorResource,
    Resource? onApiResource,
    Resource? onMoveToHome,
  }) {
    return LoginState(
      onPassErrorResource: onPassErrorResource ?? this.onPassErrorResource,
      onUsernameErrorResource: onUsernameErrorResource ?? this.onUsernameErrorResource,
      onApiResource: onApiResource ?? this.onApiResource,
      onMoveToHome: onMoveToHome ?? this.onMoveToHome,
    );
  }
}
