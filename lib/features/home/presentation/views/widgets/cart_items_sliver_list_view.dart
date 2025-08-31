import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/entities/review_entity.dart';
import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsSliverListView extends StatelessWidget {
   CartItemsSliverListView({super.key});

  final List<CartItem> cartItems = [
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    CartItem(
      cartItemEntity: CartItemEntity(
        productEntity: ProductEntity(
          productName: 'productName',
          productCode: 'productCode',
          productPrice: 10,
          productDescription: 'productDescription',
          isFeatured: true,
          productImage: 'httpasdfasdfs',
          imageUrl: 'httpasdfasdfasf',
          expiryMonths: 10,
          numOfCalories: 10,
          avgRating: 10,
          unitAmount: 10,
          reviews: <ReviewEntity>[],
        ),
      ),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) => index == cartItems.length - 1
          ? Column(children: [cartItems[index], const CustomDivider()])
          : cartItems[index],
      itemCount: cartItems.length,
    );
  }
}
