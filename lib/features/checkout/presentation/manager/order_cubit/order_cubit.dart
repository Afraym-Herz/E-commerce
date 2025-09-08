import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;
  void addOrder({required OrderEntity orderEntity}) async {
    final result = await orderRepo.addOrder(orderEntity: orderEntity);

    result.fold(
      (l) => emit(OrderAddedFailure(errMessage: l.message)),
      (r) => emit(OrderAddedSuccess()),
    );
  }
}
