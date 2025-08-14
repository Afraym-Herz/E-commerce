import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
}
