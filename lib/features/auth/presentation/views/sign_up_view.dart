import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "انشاء حساب") ,
      body: const SignUpViewBody(),
    );
  }
}
