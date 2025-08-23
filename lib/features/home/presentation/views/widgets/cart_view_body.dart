import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
             customAppBar(context, title: 'السلة', hasNotif: false,) ,
             const SizedBox(height: 20),
             Container(
              height: 41,
              decoration: const BoxDecoration(
                color: Color(0xffEBF9F1)
              ),
              child: const Center(
                child: Text('لديك 3 منتجات في سله التسوق', style: AppTextStyles.regular13 ,),
              )
             ),
             const SizedBox(height: 20),
             const Divider(height: 2, color: Color(0xffF1F1F5),),
              const CartItem() ,

            ],
          ),
        )
      ],
    );
  }
}