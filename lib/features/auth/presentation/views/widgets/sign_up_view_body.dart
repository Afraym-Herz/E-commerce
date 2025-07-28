import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            const CustomTextField(title: "اسم المستخدم"),
            const SizedBox(height: 16),
            const CustomTextField(title: "البريد الالكتروني"),
            const SizedBox(height: 16),
            const CustomPasswordField(title: "كلمة المرور"),
            const SizedBox(height: 16),
            const SizedBox(height: 18),
            CustomButton(onPressed: () {}, title: "إنشاء حساب جديد"),
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
                  child: Text( "تسجيل الدخول",
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
