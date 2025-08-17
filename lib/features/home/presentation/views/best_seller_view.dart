import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/repos/product_repo.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_seller_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});
  static const String routeName = 'bestSellerView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(productRepo: getIt<ProductRepo>() ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context, title: 'الاكثر مبيعًا'),
        body: const BestSellerListViewBlocBuilder(),
      ),
    );
  }
}
