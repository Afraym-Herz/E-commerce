part of 'login_with_google_cubit.dart';

@immutable
sealed class LoginWithGoogleState {}

final class LoginWithGoogleInitial extends LoginWithGoogleState {}

final class LoginWithGoogleLoading extends LoginWithGoogleState {}

final class LoginWithGoogleSuccess extends LoginWithGoogleState {
  final UserEntity userEntity;
  LoginWithGoogleSuccess(this.userEntity);
}

final class LoginWithGoogleFailure extends LoginWithGoogleState {
  final String message;
  LoginWithGoogleFailure(this.message);
}
