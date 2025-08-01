import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_with_google_state.dart';

class LoginWithGoogleCubit extends Cubit<LoginWithGoogleState> {
  LoginWithGoogleCubit(this.authServices) : super(LoginWithGoogleInitial());

  final AuthRepo authServices  ;

  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoading());
   final result = await authServices.signInWithGoogle();

    result.fold((failure) => emit(LoginWithGoogleFailure(failure.message)), (user) => emit(LoginWithGoogleSuccess(user)));}

}
