import 'package:e_commerce/core/helper_functions/show_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CustomButton(
            onPressed: () {
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.of(context).pushNamed(
                  CheckoutView.routeName,
                  arguments: context.read<CartCubit>().cartEntity,
                );
              } else {
                customSnackBar(context, message: 'السلة فارغة');
              }
            },
            title:
                'الدفع  ${context.watch<CartCubit>().cartEntity.calcTotalPrice()} جنيه',
          ),
        );
      },
    );
  }
}
