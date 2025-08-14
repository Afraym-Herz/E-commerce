import 'package:e_commerce/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = "forgetPasswordView";
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "نسيان كلمة المرور") ,
      body: const ForgetPasswordViewBody(),
    );
  }
}