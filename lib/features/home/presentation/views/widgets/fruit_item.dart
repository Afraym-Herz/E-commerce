import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({
    super.key,
    required this.fruitImage,
    required this.fruitPrice,
    required this.fruitName,
  });
  final String fruitImage, fruitPrice, fruitName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F5F7),
      child: Padding(
        padding: const EdgeInsets.only( left: 12, right: 12 , top: 12 ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border_rounded),
            ),
            SizedBox( 
              height: 112,
              child: Image.asset(fruitImage)),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(fruitName, style: AppTextStyles.semiBold13  , ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:"$fruitPrice جنية",
                      style: AppTextStyles.semiBold13.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 12
                      ),
                    ),
                    TextSpan(
                      text: " / الكيلو",
                      style: AppTextStyles.semiBold13.copyWith(
                        color: AppColors.lightSecondaryColor,
                        fontSize: 12
                      ),
                    
                    ),
                  ],
                ),
              ),
              trailing: Container(
              height: 50,
              width: 50,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(22),
                ),
                color: AppColors.primaryColor,
              ),
              child: const Icon(
                Icons.add_outlined,
                color: Colors.white,
                size: 40,
              ),
            ) ,
            ),   
          ],
        ),
      ),
    );
  }
}
