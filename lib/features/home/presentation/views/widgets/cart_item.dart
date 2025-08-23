import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: Image.asset(Assets.imagesWatermelon),
          ),
          const SizedBox(width: 17),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("بطيخ", style: AppTextStyles.bold13,),
              ]),
              Spacer(),
              

            ],
          )
        ],
      ),
    );
  }
}
