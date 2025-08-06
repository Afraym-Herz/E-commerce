import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/build_outline_input_border.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onSaved});
  
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      
      onSaved: onSaved,
      decoration: InputDecoration(
        
        suffixIcon: Image.asset(Assets.imagesSetting), 
        prefixIcon: Image.asset(Assets.imagesSearchGlass) ,   
        fillColor: const Color(0xffF9FAFA),
        focusedBorder: buildOutlineInputBorder().copyWith(borderSide: const BorderSide(color: Colors.green , width: 1)),
        labelText: "ابحث عن...." ,
        labelStyle: AppTextStyles.bold13.copyWith(color:  AppColors.obacityGrayColor ),
      ),
    );
  }
}