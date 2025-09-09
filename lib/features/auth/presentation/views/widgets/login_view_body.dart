import 'dart:io';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/managers/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                title: "البريد الالكتروني",
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomPasswordField(
                title: "كلمة المرور",
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(ForgetPasswordView.routeName);
                    },
                    child: Text(
                      "نسيت كلمة المرور؟",
                      style: AppTextStyles.semiBold13.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().loginUser(
                      email: email,
                      password: password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: "تسجيل الدخول",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "ليس لديك حساب؟",
                      style: AppTextStyles.semiBold16.copyWith(
                        color: AppColors.obacityGrayColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpView.routeName);
                      },
                      child: Text(
                        "قم بإنشاء حساب",
                        style: AppTextStyles.semiBold16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey.shade400),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Text("أو", style: AppTextStyles.semiBold16),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey.shade400),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              CustomSocialAuthButton(
                imageIcon: Assets.imagesGoogle,
                title: 'جوجل',
                onTap: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
              const SizedBox(height: 20),
              Platform.isIOS
                  ? Column(
                      children: [
                        CustomSocialAuthButton(
                          imageIcon: Assets.imagesAppleAc,
                          title: 'أبل',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Text('أبل'),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    )
                  : const SizedBox(),
              CustomSocialAuthButton(
                imageIcon: Assets.imagesFacebook,
                title: 'فيسبوك',

                onTap: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
