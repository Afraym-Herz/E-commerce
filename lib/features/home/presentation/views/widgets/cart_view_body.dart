import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_items_sliver_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  customAppBar(context, title: 'السلة', hasNotif: false),
                  const SizedBox(height: 20),
                  Container(
                    height: 41,
                    decoration: const BoxDecoration(color: Color(0xffEBF9F1)),
                    child: Center(
                      child: Text(
                        'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
                        style: AppTextStyles.regular13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomDivider(),
                ],
              ),
            ),
            CartItemsSliverListView(),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).size.height * 0.01,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomButton(onPressed: () {}, title: 'الدفع  180جنيه'),
          ),
        ),
      ],
    );
  }
}
