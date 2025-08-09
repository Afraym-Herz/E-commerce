
import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {

    final String userName = ModalRoute.of(context)?.settings.arguments as String? ?? "User Name";
    return Scaffold(
      body: SafeArea(child: HomeViewBody(userName: userName ,)),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
