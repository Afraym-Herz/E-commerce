import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.",
            style: AppTextStyles.semiBold16.copyWith(color: const Color(0xff616A6B)) ,
          ),
          const SizedBox(height: 16,),
          const CustomTextField(title: "رقم الهاتف"),
          const SizedBox(height: 16,),
          CustomButton(onPressed: () {}, title: "نسيت كلمة السر"),
        ],
      ),
    );
  }
}
