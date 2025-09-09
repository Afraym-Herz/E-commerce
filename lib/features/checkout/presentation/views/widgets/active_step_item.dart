import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 12,
          child: Icon(Icons.check, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
