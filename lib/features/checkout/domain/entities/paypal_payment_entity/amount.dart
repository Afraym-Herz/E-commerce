import 'package:e_commerce/core/helper_functions/get_currency.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderInputEntity orderEntity) => Amount(
    total: (orderEntity.calcTotalPrice()).toString(),
    currency: getCurrency(),
    details: DetailsEntity.fromEntity(orderEntity),
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
