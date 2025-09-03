import 'dart:developer';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/custom_checkout_app_bar.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          customCheckoutAppBar(context, title: stepItemsTitles[currentIndex] , 
          onPressed: (){
            currentIndex--;
            log('currentIndex is decresed $currentIndex');
            setState(() {});
          },
          ) ,
          const SizedBox(height: 20),
          StepItemsList(currentIndex: currentIndex),
          const SizedBox(height: 20),
          stepItemsBodies[currentIndex],

          CustomButton(
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
        ],
      ),
    );
  }

  final List<Widget> stepItemsBodies = [
    const Placeholder(),
    const SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text('العنوان')),
    ),
    const SizedBox(
      width: 50,
       height: 50,
        child: Center(child: Text('الدفع'))),
    const SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text('المراجعة')),
    ),
  ];

  final List<String> stepItemsTitles = const [
    'الشحن',
    'العنوان',
    'الدفع',
    'المراجعة',
  ];

  final List<String> buttonTitles = const [
    'التالي',
    'التالي',
    'تأكيد & استمرار',
    'تأكيد الطلب',
  ];
}
