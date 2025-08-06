import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.userName});
  final String userName ;
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Image.asset(Assets.imagesPerson)),
             Column(
              children: [
                 const Text("صباح الخير",  style: AppTextStyles.regular16 ) ,
                Text(userName , style: AppTextStyles.bold16 ,),
              ],
            ) ,
           const Spacer() ,
         Image.asset(Assets.imagesNotif) ,
          ],
        ) ;
  }
}