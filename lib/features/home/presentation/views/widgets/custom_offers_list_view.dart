import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomOffersListView extends StatelessWidget {
  const CustomOffersListView({super.key});
  final bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (index, context) {
          if (isDarkMode) {
            return GestureDetector( onTap: () {} , child: AspectRatio( aspectRatio: 342 / 158 , child: Image.asset(Assets.imagesOffersImage)));
          } else {
            return GestureDetector( onTap: () {} , child: AspectRatio( aspectRatio: 342 / 158 , child: Image.asset(Assets.imagesOffersImageLight)));
          }
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
