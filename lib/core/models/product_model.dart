import 'dart:io';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/models/review_model.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final int productPrice;
  final String productDescription;
  final bool isFeatured;
  final File productImage;
  String? imageUrl;
  final int expiryMonths;
  final bool isOrganic;
  final int numOfCalories;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;
  final List<ReviewModel> reviews ;
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
    required this.reviews ,
    this.sellingCount = 0,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productCode: json['productCode'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expiryMonths: json['expiryMonths'],
      isOrganic: json['isOrganic'],
      numOfCalories: json['numOfCalories'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      unitAmount: json['unitAmount'],
      reviews: json['reviews'].map((e) => ReviewModel.fromJson(e)).toList() ,
      sellingCount: json['sellingCount'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      productCode: productCode,
      productPrice: productPrice,
      productDescription: productDescription,
      productImage: productImage,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expiryMonths: expiryMonths,
      isOrganic: isOrganic,
      numOfCalories: numOfCalories,
      avgRating: avgRating,
      ratingCount: ratingCount,
      reviews: reviews.map((e) => e.toReviewEntity()).toList()  ,
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
      'sellingCount': sellingCount
    };
  }
}
