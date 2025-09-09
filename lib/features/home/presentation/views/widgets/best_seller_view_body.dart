import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/grid_view_fruit_item_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerViewBody extends StatefulWidget {
  const BestSellerViewBody({super.key});

  @override
  State<BestSellerViewBody> createState() => _BestSellerViewBodyState();
}

class _BestSellerViewBodyState extends State<BestSellerViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 12, left: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text('الاكثر مبيعًا', style: AppTextStyles.bold19),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
        GridViewFruitItemBlocBuilder(),
      ],
    );
  }
}
