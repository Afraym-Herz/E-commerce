
import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/helper_functions/get_dummy_product.dart';
import 'package:e_commerce/core/widgets/custom_error_widget.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/products_view_body_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsViewBlocBuilder extends StatelessWidget {
  const ProductsViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsViewBodyResults(productsList: state.products);
        } else if (state is ProductsFailure) {
          return CustomErrorWidget(message: state.message);
        } else {
          return Skeletonizer(
            enabled: state is ProductsLoading,
            child: ProductsViewBodyResults(productsList: getDummyProducts()),
          );
        }
      },
    );
  }
}
