
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HTextRow extends StatelessWidget {
  const HTextRow({
    super.key,required this.onPressed, required this.title, required this.lastText,
  });
  final VoidCallback onPressed;
  final String title;
  final String lastText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(title, style: AppTextStyles.bold16),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            lastText,
            style: AppTextStyles.regular13.copyWith(
              color: AppColors.obacityGrayColor,
            ),
          ),
        ),
      ],
    );
  }
}