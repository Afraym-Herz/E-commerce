import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';

class StepItemsList extends StatelessWidget {
  StepItemsList({super.key, this.currentIndex = 0});
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepItemsTitles().length, (index) {
        return Expanded(
          child: StepItem(
            text: stepItemsTitles()[index],
            index: index + 1,
            isActive: currentIndex >= index,
          ),
        );
      }),
    );
  }
}

List<String> stepItemsTitles() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
