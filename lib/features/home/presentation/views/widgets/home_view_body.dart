import 'package:e_commerce/core/widgets/custom_search_text_field.dart';
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
          SliverToBoxAdapter(child: CustomHomeAppBar(userName: userName ,)) ,
          SliverToBoxAdapter(child: CustomSearchTextField(onSaved: (value) {},)),
          const SliverToBoxAdapter(child: SizedBox(height: 20,)),
           const SliverToBoxAdapter(child: CustomOffersListView())
      ]),
    ) ;
  }
}