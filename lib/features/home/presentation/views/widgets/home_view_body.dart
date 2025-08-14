import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/helper_functions/get_saved_user_data.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/features/home/presentation/views/best_seller_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_grid_view_fruits_items.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_offers_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(userName: getSavedUserData(key: kUserData ).name),
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
                        onPressed: () {
                          Navigator.pushNamed(context, BestSellerView.routeName);
                        },
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
              ],
            ),       
          ),
           const CustomGridViewFruitsItems(),
        ],
      ),
    );
  }
}
