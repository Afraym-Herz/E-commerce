import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/entities/review_entity.dart';
import 'package:e_commerce/core/helper_functions/get_avg_rating.dart';
import 'package:e_commerce/core/models/review_model.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final int productPrice;
  final String productDescription;
  final String productImage;
  final bool isFeatured;
  String? imageUrl;
  final int expiryMonths;
  final bool isOrganic;
  final int numOfCalories;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;
  List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.isFeatured,
    this.imageUrl,
    required this.expiryMonths,
    required this.isOrganic,
    required this.numOfCalories,
    required this.avgRating,
    required this.ratingCount,
    required this.unitAmount,
    required this.reviews,
    this.sellingCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productImage: json['productImage'] ?? '',
      productName: json['productName'],
      productCode: json['productCode'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expiryMonths: json['expiryMonths'],
      isOrganic: json['isOrganic'],
      numOfCalories: json['numOfCalories'],
      avgRating: getAvgRating(
        json['reviews']
            .map<ReviewEntity>((e) => ReviewModel.fromJson(e).toReviewEntity())
            .toList(),
      ),
      ratingCount: json['ratingCount'],
      unitAmount: json['unitAmount'] ?? 0,
      reviews: json['reviews']
          .map<ReviewModel>((e) => ReviewModel.fromJson(e))
          .toList(),
      sellingCount: json['sellingCount'] ?? 0,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      productCode: productCode,
      productPrice: productPrice,
      productDescription: productDescription,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expiryMonths: expiryMonths,
      isOrganic: isOrganic,
      numOfCalories: numOfCalories,
      avgRating: avgRating,
      ratingCount: ratingCount,
      productImage: productImage,
      reviews: reviews.map((e) => e.toReviewEntity()).toList(),
      unitAmount: unitAmount,
    );
  }

  toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expiryMonths': expiryMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'reviews': reviews,
      'sellingCount': sellingCount,
    };
  }
}
