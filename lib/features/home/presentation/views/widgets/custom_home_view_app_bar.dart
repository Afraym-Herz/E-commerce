import 'dart:developer';

import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesPerson),
      title: Text(
        "صباح الخير !..",
        style: AppTextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: Text(userName, style: AppTextStyles.bold16),
      trailing: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: 50,
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Color(0xffeef8ed),
          ),
          child: Image.asset(Assets.imagesNotif),
        ),
      ),
    );
  }
}
