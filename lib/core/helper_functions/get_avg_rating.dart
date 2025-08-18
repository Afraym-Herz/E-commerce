import 'package:e_commerce/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  num totalRating = 0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}