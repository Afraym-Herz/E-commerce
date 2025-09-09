import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ShippingWayItem extends StatelessWidget {
  const ShippingWayItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
  });
  final bool isSelected;
  final String title, subtitle, price;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.lightObacityGrayColor,
        border: Border.all(
          color: isSelected
              ? AppColors.lightPrimaryColor
              : AppColors.lightObacityGrayColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(
              BorderSide(
                color: isSelected ? Colors.white : Colors.black,
                width: 1,
              ),
            ),
          ),
          child: isSelected
              ? const Icon(
                  Icons.circle,
                  color: AppColors.primaryColor,
                  size: 16,
                )
              : null,
        ),
        title: Text(
          title,
          style: AppTextStyles.semiBold13.copyWith(fontSize: 14),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.regular13.copyWith(fontSize: 14),
        ),
        trailing: Text(
          price,
          style: AppTextStyles.bold13.copyWith(
            color: AppColors.primaryColor,
            fontSize: 14,
          ),
        ),
        visualDensity: const VisualDensity(vertical: 4),
      ),
    );
  }
}
