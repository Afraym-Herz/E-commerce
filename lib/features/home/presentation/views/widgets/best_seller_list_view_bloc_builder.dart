import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/helper_functions/get_dummy_product.dart';
import 'package:e_commerce/core/widgets/custom_error_widget.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_seller_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) { 
        return Skeletonizer(
            enabled: true ,
            child: BestSellerViewBody(
              products: getDummyProducts()
              ),
          );
        if (state is ProductsSuccess) {
          return BestSellerViewBody(products: state.products);
        } else if (state is ProductsFailure) {
          return CustomErrorWidget(message: state.message);
        } else {
        
        }
      },
    );
  }
}
