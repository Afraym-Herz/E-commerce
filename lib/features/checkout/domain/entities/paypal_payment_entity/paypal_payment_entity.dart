import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity orderEntity){
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: "The payment transaction",
      itemList: ItemList.fromEntity(orderEntity),
    );
  }


  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
