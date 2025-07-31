import 'package:e_commerce/core/helper_functions/show_snack_bar.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});
  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool acceptedConditions = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              CustomTextFormField(
                title: "اسم المستخدم",
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16),
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
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 0,
                runSpacing: 0,
                alignment: WrapAlignment.start,
                children: [
                  CustomCheckBox(
                    onChanged: (value) {
                      setState(() {
                        acceptedConditions = !acceptedConditions;
                      });
                    },
                    acceptedConditions: acceptedConditions,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "من خلال إنشاء حساب ، فإنك توافق على",
                    style: AppTextStyles.semiBold13.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  const CustomTextButton(word: "الشروط"),
                  const CustomTextButton(word: "والأحكام"),
                  const CustomTextButton(word: 'الخاصة بنا'),
                ],
              ),
              const SizedBox(height: 18),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    acceptedConditions
                        ? context
                              .read<SignupCubit>()
                              .createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              )
                        : customSnackBar(
                            context,
                            message: "يرجى الموافقة على الشروط والأحكام",
                          );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                title: "إنشاء حساب جديد",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " لديك حساب بالفعل؟",
                    style: AppTextStyles.semiBold16.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: AppTextStyles.semiBold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
