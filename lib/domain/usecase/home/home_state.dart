part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Resource? onLogout;
  final Resource? onMoveToLogin;
  final Resource? onApiResource;

  const HomeState({this.onLogout, this.onMoveToLogin,this.onApiResource});

  factory HomeState.initial() {
    return const HomeState();
  }

  @override
  List<Object?> get props => [onLogout, onMoveToLogin, onApiResource];

  HomeState copyWith({
    Resource? onLogout,
    Resource? onMoveToLogin,
    Resource? onApiResource,
  }) {
    return HomeState(
      onLogout: onLogout ?? this.onLogout,
      onMoveToLogin: onMoveToLogin ?? this.onMoveToLogin,
      onApiResource: onApiResource ?? this.onApiResource,
    );
  }
}
