import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/utils/backend_endpoints.dart';
import 'package:e_commerce/features/checkout/data/models/order_model.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServices databaseServices;

  OrderRepoImpl({required this.databaseServices});

  @override
  Future<Either<Failures, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      databaseServices.addData(
        path: BackendEndpoints.orders,
        data: OrderModel.fromEntity(orderEntity).toJson(),
        documentId: orderEntity.uID,
      );
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
