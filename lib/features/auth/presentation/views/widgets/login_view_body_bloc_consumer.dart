import 'dart:developer';

import 'package:e_commerce/core/helper_functions/show_snack_bar.dart';
import 'package:e_commerce/features/auth/presentation/managers/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
  
         Navigator.pushReplacementNamed(context, HomeView.routeName , arguments: state.userEntity.name); // exist user name 
        } else if (state is LoginFailure) {
          customSnackBar(context, message: state.message );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
