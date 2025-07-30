import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool acceptedConditions = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 24,
      height: 24,
      child: Checkbox(
        value: acceptedConditions,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
        ),

        onChanged: (value) {
          setState(() {
            acceptedConditions = value!;
          });
        },
        activeColor: AppColors.primaryColor,
        checkColor: Colors.white,
      ),
    );
  }
}
