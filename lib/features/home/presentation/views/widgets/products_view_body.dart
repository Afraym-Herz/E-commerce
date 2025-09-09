import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/core/widgets/h_text_row.dart';
import 'package:e_commerce/core/widgets/h_text_widget.dart';
import 'package:e_commerce/features/home/presentation/views/best_seller_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_product_fruit_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key, required this.productsList});

  final List<ProductEntity> productsList;

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
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
                const HTextWidget(title: 'منتجاتنا'),
                const SizedBox(height: 20),
                CustomProductFruitItemListView(
                  productsEntity: widget.productsList,
                ),
                const SizedBox(height: 20),
                HTextRow(
                  onPressed: () {
                    Navigator.pushNamed(context, BestSellerView.routeName);
                  },
                  title: 'الأكثر مبيعًا',
                  lastText: 'المزيد',
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
