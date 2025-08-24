import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/add_delete_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16 , ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 73,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
              child: Image.asset(Assets.imagesWatermelon),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 3.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("بطيخ", style: AppTextStyles.bold13),
                        const Spacer(),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '3 كم',
                        style: AppTextStyles.regular13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                     Row(
                      children: [
                        const AddDeleteButton(sizes: 26),
                        const SizedBox(width: 20),
                        const Text(
                          '3',
                          style: AppTextStyles.bold16,
                        ),
                        const SizedBox(width: 20),
                        const AddDeleteButton(sizes: 26, isDelete: true),
                        const Spacer() ,
                        Text('60 جنيه ' , style: AppTextStyles.bold16.copyWith(color: AppColors.secondaryColor) ,)
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
