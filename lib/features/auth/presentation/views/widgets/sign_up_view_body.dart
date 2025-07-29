import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool acceptedConditions = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const CustomTextFormField(title: "اسم المستخدم"),
            const SizedBox(height: 16),
            const CustomTextFormField(title: "البريد الالكتروني"),
            const SizedBox(height: 16),
            const CustomPasswordField(title: "كلمة المرور"),
            const SizedBox(height: 16),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 0,
              runSpacing: 0,
              alignment: WrapAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: Checkbox(
                    activeColor : AppColors.primaryColor,
                    value: acceptedConditions,
                    onChanged: (isAccepted) {
                      setState(() {
                        acceptedConditions = isAccepted!;
                      });
                    },
                  ),
                ),
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
               acceptedConditions ? Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Text("انشاء حساب جديد");
                    },
                  ),
                ) : null;
                
                
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
    );
  }
}
