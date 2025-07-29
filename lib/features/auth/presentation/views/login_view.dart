import 'package:e_commerce/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "تسجيل الدخول"),
      body: const LoginViewBody(),
    );
  }
}
