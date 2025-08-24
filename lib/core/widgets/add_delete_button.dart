import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddDeleteButton extends StatelessWidget {
  const AddDeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        color: AppColors.primaryColor,
      ),
      child: const Icon(
        Icons.add_outlined,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
