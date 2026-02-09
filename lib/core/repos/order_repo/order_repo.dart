import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failures, void>> addOrder({required OrderInputEntity orderInputEntity});
  
}
