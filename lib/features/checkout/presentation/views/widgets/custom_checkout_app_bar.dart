import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar customCheckoutAppBar(BuildContext context , {required String title ,required VoidCallback onPressed }) =>  AppBar(
    title:  Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.white,
    leading: IconButton(
    onPressed:onPressed,
    
    icon: const Icon(
      Icons.arrow_back_ios_rounded,
      color: Color(0xff000000),
    ),
    ),

  );