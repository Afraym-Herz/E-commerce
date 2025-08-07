import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActiveBottomNavigationBarItem extends StatelessWidget {
  const ActiveBottomNavigationBarItem({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal:  8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color.fromARGB(255, 217, 233, 234),
          ),
          child: Align(
            alignment: Alignment.centerLeft ,
            child: Text(
              label,
              style: AppTextStyles.semiBold11.copyWith(
                color: AppColors.primaryColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
         Positioned(
          right: 3,
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              color: AppColors.primaryColor,
            ),
            child: Icon(icon, color: Colors.white),
          ),
        )
      ],
    );
  }
}
