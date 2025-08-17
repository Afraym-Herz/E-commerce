import 'package:e_commerce/features/home/presentation/views/best_seller_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
   const MainView({super.key});
  static const routeName = 'main';
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BestSellerView()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
