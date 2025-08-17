import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:flutter/material.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key, required this.products});
  final List<ProductEntity> products ;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only( right: 12,  left: 12,),
          child: Column(
            children: [
              SizedBox(height: 25,),
              Align(alignment: Alignment.centerRight, child: Text('الاكثر مبيعًا', style: AppTextStyles.bold19,)),
            ],
          ),
        ),
      ),
      ),       
      CustomGridViewFruitsItems(
        productsList: products,
      ),
      ],
    );
  }
}