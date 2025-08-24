import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    this.isDelete = false,
    required this.sizes,
  });
  final bool isDelete;
  final double sizes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes,
      width: sizes,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(22),
        ),
        color: isDelete ? AppColors.lightObacityGrayColor : AppColors.primaryColor,
      ),
      child: Icon(
       isDelete ? Icons.remove_outlined : Icons.add_outlined,
        color: isDelete ? const Color(0xff979899) : Colors.white,
        size: sizes - (sizes * 0.25),
      ),
    );
  }
}
