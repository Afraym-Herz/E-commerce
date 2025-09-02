import 'package:e_commerce/core/helper_functions/show_snack_bar.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
      if (state is CartItemAdded) {
  customSnackBar(context, message: 'Item added to cart');
}
else if (state is CartItemRemoved) {
  customSnackBar(context, message: 'Item removed from cart');
}
      },
      child: SafeArea(child: MainViewBody(currentIndex: currentIndex)),
    );
  }
}
