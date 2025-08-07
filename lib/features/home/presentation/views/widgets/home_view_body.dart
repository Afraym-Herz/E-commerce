import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_offers_list_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomHomeAppBar(userName: userName)),
          SliverToBoxAdapter(child: CustomSearchTextField(onSaved: (value) {})),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: CustomOffersListView()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  const Text("الاكثر مبيعًا", style: AppTextStyles.bold16),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "المزيد",
                      style: AppTextStyles.regular13.copyWith(
                        color: AppColors.obacityGrayColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomGridViewFruitsItems()
          ),
        ],
      ),
    );
  }
}
