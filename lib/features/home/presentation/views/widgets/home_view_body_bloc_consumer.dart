import 'dart:developer';

import 'package:e_commerce/core/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBodyBlocConsumer extends StatelessWidget {
  const HomeViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< ProductsCubit , ProductsState >(
      listener: (context, state) {
      },
      builder: (context, state) {
        return const HomeViewBody();
      },
    );
  }
}
