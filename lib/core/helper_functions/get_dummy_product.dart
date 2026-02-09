import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/entities/review_entity.dart';
import 'package:e_commerce/core/utils/assets.dart';

ProductEntity getDummyProduct() {
  return const ProductEntity(
    productName: "Dummy Product",
    productCode: "DUMMY123",
    productPrice: 9,
    productDescription: "This is a dummy product",
    isFeatured: false,
    imageUrl: Assets.imagesMango,
    expiryMonths: 6,
    isOrganic: true,
    numOfCalories: 100,
    avgRating: 4.5,
    ratingCount: 10,
    unitAmount: 1.0,
    productImage: '',
    reviews: <ReviewEntity>[],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
