import 'dart:developer';

import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
       final String userName = ModalRoute.of(context)?.settings.arguments as String? ??"User Name";
       log(userName);
      
    return Scaffold(
      appBar: AppBar(

        title: Row(
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
        ) 
      ),
      body: const HomeViewBody(),
    );
  }
}