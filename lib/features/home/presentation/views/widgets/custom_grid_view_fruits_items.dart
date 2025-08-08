import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class CustomGridViewFruitsItems extends StatelessWidget {
  const CustomGridViewFruitsItems({super.key});
  final List<FruitItem> fruitsList = const [
    FruitItem(fruitImage: Assets.imagesWatermelon , fruitName: 'بطيخ' , fruitPrice: '30' , ),
    FruitItem(fruitImage: Assets.imagesStrawberry , fruitName: 'فراولة' , fruitPrice: '200' , ),
    FruitItem(fruitImage: Assets.imagesAvocado , fruitName: 'أفوكادو' , fruitPrice: '200' , ),
    FruitItem(fruitImage: Assets.imagesPineappleFruit , fruitName: 'أناناس' , fruitPrice: '20' , ),
    FruitItem(fruitImage: Assets.imagesWatermelon , fruitName: 'بطيخ' , fruitPrice: '30' , ),
    FruitItem(fruitImage: Assets.imagesStrawberry , fruitName: 'فراولة' , fruitPrice: '200' , ),
    FruitItem(fruitImage: Assets.imagesAvocado , fruitName: 'أفوكادو' , fruitPrice: '200' , ),
    FruitItem(fruitImage: Assets.imagesPineappleFruit , fruitName: 'أناناس' , fruitPrice: '20' , ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: 
    const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 16 ,
      childAspectRatio: 163/214,
    ) , 
    itemCount: fruitsList.length
    , itemBuilder: (context , index ){
      return fruitsList[index];
    }) ;
  }
}