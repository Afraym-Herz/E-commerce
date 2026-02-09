import 'package:e_commerce/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String productName;
  final String productCode;
  final int productPrice;
  final String productDescription;
  final String productImage;
  final bool isFeatured;
  final String? imageUrl;
  final int expiryMonths;
  final bool isOrganic;
  final int numOfCalories;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;
  final List<ReviewEntity> reviews;
  const ProductEntity({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.isFeatured,
    required this.productImage,
    this.imageUrl,
    required this.expiryMonths,
    this.isOrganic = false,
    required this.numOfCalories,
    required this.avgRating,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.reviews,
  });

  @override
  List<Object?> get props => [productCode];
}
