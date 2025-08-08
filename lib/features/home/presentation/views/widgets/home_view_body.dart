import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_offers_list_view.dart';
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(userName: userName),
                CustomSearchTextField(onSaved: (value) {}),
                const SizedBox(height: 20),
                const CustomOffersListView(),
                const SizedBox(height: 20),
                SizedBox(
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
                const CustomGridViewFruitsItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
