part of 'order_cubit.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderAddedLoading extends OrderState {}

final class OrderAddedSuccess extends OrderState {}

final class OrderAddedFailure extends OrderState {
  final String errMessage;
  OrderAddedFailure({required this.errMessage});
}
