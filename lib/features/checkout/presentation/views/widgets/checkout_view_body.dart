import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/inactive_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_items_list.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          customAppBar(context, title: 'الشحن'),
          const SizedBox(height: 20,),
          const StepItemsList(),
        ],
      ),
    );
  }
}
