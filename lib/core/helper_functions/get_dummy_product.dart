
import 'package:e_commerce/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
  productName: "Dummy Product",
  productCode: "DUMMY123",
  productPrice: 9,
  productDescription: "This is a dummy product",
  isFeatured: false,
  imageUrl: "assets/images/mango.png",
  expiryMonths: 6,
  isOrganic: true,
  numOfCalories: 100,
  avgRating: 4.5,
  ratingCount: 10,
  unitAmount: 1.0,
);
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
