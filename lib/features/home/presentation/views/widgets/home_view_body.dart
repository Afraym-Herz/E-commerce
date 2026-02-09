import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/helper_functions/get_saved_user_data.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/core/widgets/h_text_row.dart';
import 'package:e_commerce/features/home/presentation/views/best_seller_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_offers_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.productsList});
  final List<ProductEntity> productsList;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  
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
                CustomHomeAppBar(
                  userName: getSavedUserData(key: kUserData).name,
                ),
                CustomSearchTextField(onSaved: (value) {}),
                const SizedBox(height: 20),
                const CustomOffersListView(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: HTextRow(
                    onPressed: () {
                      Navigator.pushNamed(context, BestSellerView.routeName);
                    },
                    title: 'الأكثر مبيعًا',
                    lastText: 'المزيد',
                  ),
                ),
              ],
            ),
          ),
          const CustomGridViewFruitsItems(),
        ],
      ),
    );
  }
}
