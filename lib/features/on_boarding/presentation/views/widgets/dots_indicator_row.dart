import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DotIndicatorsRow extends StatelessWidget {
  const DotIndicatorsRow({super.key, required int currentPage})
    : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 10),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == 1
                ? AppColors.primaryColor
                : AppColors.lightPrimaryColor.withValues(alpha: .5),
          ),
        ),
      ],
    );
  }
}
