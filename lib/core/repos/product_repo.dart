import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductEntity>>> getProducts({required String categoryId});
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();

}