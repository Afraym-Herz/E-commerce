import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_seller_view_body.dart';
import 'package:flutter/material.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});
  static const String routeName = 'bestSellerView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  customAppBar(context,title: 'الاكثر مبيعًا',),
      body: const BestSellerViewBody() ,
    );
  }
}