import 'dart:developer';

import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/helper_functions/get_dummy_product.dart';
import 'package:e_commerce/core/widgets/custom_error_widget.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridViewFruitItemBlocBuilder extends StatelessWidget {
  const GridViewFruitItemBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          log('is product success ${state.products.length.toString()}');
          return CustomGridViewFruitsItems(productsList: state.products);
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.message));
        } else if (state is ProductsLoading) {
          log('is product loading ');
          return Skeletonizer.sliver(
            enabled: true,
            child: CustomGridViewFruitsItems(productsList: getDummyProducts()),
          );
        } else {
          log('is in else scope');
          return const SliverToBoxAdapter(
            child: CustomErrorWidget(message: 'is in else scope'),
          );
        }
      },
    );
  }
}
