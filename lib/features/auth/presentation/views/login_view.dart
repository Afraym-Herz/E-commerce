import 'dart:developer';

import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context: context, title: "تسجيل الدخول"),
        body: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}

