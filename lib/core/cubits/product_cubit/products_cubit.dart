import 'package:e_commerce/core/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productRepo}) : super(ProductsInitial());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (l) => emit(ProductsFailure(message: l.message)),
      (r) => emit(ProductsSuccess(products: r)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold(
      (l) => emit(ProductsFailure(message: l.message)),
      (r) => emit(ProductsSuccess(products: r)),
    );
  }

}
