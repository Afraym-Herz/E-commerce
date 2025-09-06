import 'package:e_commerce/features/checkout/presentation/views/widgets/add_address_body.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_body.dart';
import 'package:flutter/material.dart';

class StepsBodyPageView extends StatelessWidget {
  const StepsBodyPageView({super.key, required this.pageController});

  final PageController pageController;
  

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return stepItemsBodies()[index];
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stepItemsBodies().length,
    );
  }

 

}
List<Widget> stepItemsBodies (){
    return [
      const ShippingBody(),
      const AddAddressBody(),
      const SizedBox(width: 50, height: 50, child: Center(child: Text('الدفع'))),
      const SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text('المراجعة')),
    ),
  ];
  } 