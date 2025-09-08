import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body_2.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Provider.value(
        value: OrderEntity(cartEntity) ,
        child: const CheckoutViewBody2()),
      backgroundColor: Colors.white,
    );
  }
}
