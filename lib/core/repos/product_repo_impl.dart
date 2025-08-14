import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/models/product_model.dart';
import 'package:e_commerce/core/repos/product_repo.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/utils/backend_endpoints.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts({
    required String categoryId,
  }) async {
    try {
      var productsCollection = await databaseServices.getData(
        path: BackendEndpoints.products,
      );

      return right(
        await productsCollection.docs
            .map((e) => ProductModel.fromJson(e.data()).toEntity())
            .toList(),
      );
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    
    try {
      var productsCollection = await databaseServices.getData(
        path: BackendEndpoints.products,
        query: {"orderBy": "sellingCount", "descending": true, "limit": 10},
       ) as List<Map<String, dynamic>> ;

      List<ProductEntity> bestSellingProductsList = [];

      bestSellingProductsList =  productsCollection
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(bestSellingProductsList);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
