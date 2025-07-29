import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({ required BuildContext context , required String title}) =>  AppBar(
      title:  Text(title, style: AppTextStyles.bold19),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Color(0xff000000),
        ),
      ),
    );