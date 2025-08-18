
import 'package:e_commerce/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });


   factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? 0,
      date: json['date'] ?? '',
      reviewDescription: json['reviewDescription'] ?? '',
    );
  }

  ReviewEntity toReviewEntity () => ReviewEntity(
    name: name,
    image: image,
    rating: rating,
    date: date,
    reviewDescription: reviewDescription,
  );

  toMap () => {
    'name': name,
    'image': image,
    'rating': rating,
    'date': date,
    'reviewDescription': reviewDescription,
  };

}
