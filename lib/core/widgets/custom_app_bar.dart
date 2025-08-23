import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context , {required String title , bool hasNotif = true}) =>  AppBar(
    title:  Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.white,
    
    leading: IconButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    icon: const Icon(
      Icons.arrow_back_ios_rounded,
      color: Color(0xff000000),
    ),
    ),
    actions: [
      Visibility(
        visible: hasNotif,
        child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
                color: Color(0xffeef8ed),
              ),
              child: Image.asset(Assets.imagesNotif),
            ),
          ),
      ),
    ],
  );