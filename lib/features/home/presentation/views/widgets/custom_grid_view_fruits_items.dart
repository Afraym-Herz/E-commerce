import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class CustomGridViewFruitsItems extends StatelessWidget {
  const CustomGridViewFruitsItems({super.key, required this.productsList});
  final List<ProductEntity>? productsList;


  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemCount: productsList!.length ,
      itemBuilder: (context, index) {
      return FruitItem(productEntity: productsList![index]);
      },
    );
  }
}
