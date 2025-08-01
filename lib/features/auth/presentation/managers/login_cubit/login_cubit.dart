import 'package:e_commerce/core/services/firebase_auth_services.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo ;

  Future<void> loginUser( {
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(email: email, password: password);
    result.fold((failure) => emit(LoginFailure(failure.message)), (user) => emit(LoginSuccess(user)));
  }


}
