import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/models/product_model.dart';
import 'package:e_commerce/core/repos/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts({
    required String categoryId,
  }) async {
    try {
      var productsCollection = await FirebaseFirestore.instance
          .collection(categoryId)
          .get();

      return right(
        productsCollection.docs
            .map((e) => ProductModel.fromJson(e.data()).toEntity())
            .toList(),
      );
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}
