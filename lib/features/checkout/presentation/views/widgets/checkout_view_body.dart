import 'dart:developer';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/add_address_body.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/custom_checkout_app_bar.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_body.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_items_list.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customCheckoutAppBar(
              context,
              currentIndex: currentIndex,
              onPressed: () {
                currentIndex--;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            StepItemsList(),
            const SizedBox(height: 20),
            stepItemsBodies[currentIndex],
          ],
        ),
        currentIndex == 0
            ? Positioned(
                bottom: 400,
                left: 0,
                right: 0,
                child: CustomButton(
                  onPressed: () {
                    if (currentIndex < stepItemsBodies.length - 1) {
                      currentIndex++;
                      setState(() {});
                    } else {
                      log('it is end of steps');
                    }
                  },
                  title: buttonTitles[currentIndex],
                ),
              )
            : Positioned(
                bottom: 200,
                left: 0,
                right: 0,
                child: CustomButton(
                  onPressed: () {
                    if (currentIndex < stepItemsBodies.length - 1) {
                      currentIndex++;
                      if (currentIndex == 1 || currentIndex == 2) {}
                      setState(() {});
                    } else {
                      log('it is end of steps');
                    }
                  },
                  title: buttonTitles[currentIndex],
                ),
              ),
      ],
    );
  }

  final List<Widget> stepItemsBodies = [
    const ShippingBody(),
    AddAddressBody(),
    const SizedBox(width: 50, height: 50, child: Center(child: Text('الدفع'))),
  ];

  final List<String> buttonTitles = const ['التالي', 'التالي', 'تأكيد الطلب'];
}
