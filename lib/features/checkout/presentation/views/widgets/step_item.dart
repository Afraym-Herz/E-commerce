import 'package:e_commerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/inactive_step_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text;
  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.center,
      firstChild: InActiveStepItem(text: text, index: index),
      secondChild: ActiveStepItem(text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 500),
    );
  }
}
