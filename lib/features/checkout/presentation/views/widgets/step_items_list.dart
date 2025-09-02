import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';

class StepItemsList extends StatelessWidget {
  const StepItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepItemsTexts.length, (index) {
        return Expanded(
          child: StepItem(
            text: stepItemsTexts[index],
            index: index + 1,
            isActive: false,
          ),
        );
      }),
    );
  }

  final List<String> stepItemsTexts = const [
    'الشحن',
    'العنوان',
    'الدفع',
    'المراجعة',
  ];
}
