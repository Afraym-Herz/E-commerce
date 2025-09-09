import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/helper_functions/get_saved_user_data.dart';
import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/order_cubit/order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body_2.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(getIt<OrderRepo>()),
      child: Scaffold(
        body: Provider.value(
          value: OrderEntity(
            cartEntity,
            uID: getSavedUserData(key: kUserData).uId,
          ),
          child: const AddOrderCubitBlocConsumer(child: CheckoutViewBody2()),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
