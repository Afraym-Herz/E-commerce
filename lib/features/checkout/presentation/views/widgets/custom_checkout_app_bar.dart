import 'dart:developer';

import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar customCheckoutAppBar(
  BuildContext context, {
  required int currentIndex,
  VoidCallback? onPressed,
}) => AppBar(
  title: Text(buttonTitles[currentIndex], style: AppTextStyles.bold19),
  centerTitle: true,
  backgroundColor: Colors.white,
  scrolledUnderElevation: 0,
  surfaceTintColor: Colors.white,
  leading: IconButton(
    onPressed: onPressed ?? () {
            log(currentIndex.toString());
            Navigator.of(context).pop();
          },
    icon: const Icon(Icons.arrow_back_ios_rounded, color: Color(0xff000000)),
  ),
);

const List<String> buttonTitles = [
  'التالي',
  'التالي',
  'تأكيد & استمرار',
  'تأكيد الطلب',
];
