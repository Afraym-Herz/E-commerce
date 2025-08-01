import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()), // maype was error
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context: context, title: "انشاء حساب"),
        body: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
