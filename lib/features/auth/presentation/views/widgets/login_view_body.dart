import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_password_field.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: kHorizintalPadding ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(title: "البريد الالكتروني"),
            const SizedBox(height: 16),
            const CustomPasswordField(title: "كلمة المرور"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgetPasswordView.routeName);
                  },
                  child: Text("نسيت كلمة المرور؟",
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.primaryColor,
                  ),)
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(onPressed: () {}, title: "تسجيل الدخول"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "ليس لديك حساب؟",
                    style: AppTextStyles.semiBold16.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUpView.routeName);
                    },
                    child: Text( "قم بإنشاء حساب",
                    style: AppTextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),),
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
            CustomListTile(
              imageIcon: Assets.imagesGoogle ,
              title: 'جوجل',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Text('جوجل')),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomListTile(
              imageIcon: Assets.imagesAppleAc,
              title: 'أبل',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Text('أبل')),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomListTile(
              imageIcon:  Assets.imagesFacebook ,
              title: 'فيسبوك',
            
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Text('فيسبوك')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
