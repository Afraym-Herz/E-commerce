import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(productRepo: getIt<ProductRepo>())..getProducts(),
      child: const HomeViewBodyBlocBuilder(),
    );
  }
}
