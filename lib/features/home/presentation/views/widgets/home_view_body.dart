import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return  CustomHomeAppBar(
      userName: userName ,
    );
  }
}