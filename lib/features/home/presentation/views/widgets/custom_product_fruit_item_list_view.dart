import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_product_fruit_item.dart';
import 'package:flutter/material.dart';
class CustomProductFruitItemListView extends StatelessWidget {
  const CustomProductFruitItemListView({super.key, required this.productsEntity});

  final List<ProductEntity> productsEntity  ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: ListView.builder(        
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: productsEntity.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric( horizontal: 8.0),
            child: CustomProductFruitItem(productEntity: productsEntity[index],),
          );
        },
      ),
    );
  }
}

