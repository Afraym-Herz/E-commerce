import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/core/widgets/products_view_header.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBodyResults extends StatefulWidget {
  const ProductsViewBodyResults({super.key, required this.productsList});
  final List<ProductEntity> productsList;

  @override
  State<ProductsViewBodyResults> createState() =>
      _ProductsViewBodyResultsState();
}

class _ProductsViewBodyResultsState extends State<ProductsViewBodyResults> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                customAppBar(context, title: 'المنتجات', hasNotif: true),
                const SizedBox(height: 20),
                CustomSearchTextField(onSaved: (value) {}),
                const SizedBox(height: 20),
                ProductsViewHeader(
                  title: 'نتائج',
                  productsLength: context.read<ProductsCubit>().productsLength,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          CustomGridViewFruitsItems(productsList: widget.productsList),
        ],
      ),
    );
  }
}
