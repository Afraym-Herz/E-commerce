import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/build_outline_input_border.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.title, this.onSaved});

  final String title;
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9FAFA),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'يجب ادخال ${widget.title}';
          }
          return null;
        },
        onSaved: widget.onSaved,
        obscureText: !isVisible,
        decoration: InputDecoration(
          focusColor: AppColors.obacityGrayColor,
          fillColor: AppColors.obacityGrayColor,
          contentPadding: const EdgeInsets.all(22),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: isVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            color: const Color(0xffC9CECF),
          ),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder().copyWith(
            borderSide: const BorderSide(color: Colors.green, width: 1),
          ),

          labelText: widget.title,
          labelStyle: AppTextStyles.bold13.copyWith(
            color: AppColors.obacityGrayColor,
          ),
        ),
      ),
    );
  }
}
