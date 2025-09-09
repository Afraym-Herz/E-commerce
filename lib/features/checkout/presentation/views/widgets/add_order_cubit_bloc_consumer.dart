import 'package:e_commerce/core/helper_functions/show_snack_bar.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/custom_progress_hud.dart';
import 'package:e_commerce/features/checkout/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderAddedSuccess) {
          customSnackBar(context, message: 'Order Added Successfully');
        } else if (state is OrderAddedFailure) {
          customSnackBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is OrderAddedLoading,
          child: child,
        );
      },
    );
  }
}
