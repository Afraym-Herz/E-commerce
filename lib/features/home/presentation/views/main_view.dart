import 'package:e_commerce/features/home/presentation/views/cart_view.dart';
import 'package:e_commerce/features/home/presentation/views/products_view.dart';
import 'package:e_commerce/features/home/presentation/views/profile_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
   const MainView({super.key});
  static const routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  final List<Widget> screens = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
    const ProfileView(),
  ];


 int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        index: currentIndex ,
      ),
      body: SafeArea(child: screens[currentIndex]),
      
    );
  }
}
