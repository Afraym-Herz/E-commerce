import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.lightObacityGrayColor,
          radius: 12,
          child: Text('$index', style: AppTextStyles.bold13),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.bold13.copyWith(
            color: AppColors.obacityGrayColor,
          ),
        ),
      ],
    );
  }
}
