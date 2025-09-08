import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
   final String name;
   final String email;
   final String addressDetails;
   final String city;
   final String floor;
   final String phone;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.addressDetails,
    required this.city,
    required this.floor,
    required this.phone,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name!,
      email: shippingAddressEntity.email!,
      addressDetails: shippingAddressEntity.addressDetails!,
      city: shippingAddressEntity.city!,
      floor: shippingAddressEntity.floor!,
      phone: shippingAddressEntity.phone!,
    );
  }

  toJson() => {
    'name': name,
    'email': email,
    'addressDetails': addressDetails,
    'city': city,
    'floor': floor,
    'phone': phone,
  };

}
