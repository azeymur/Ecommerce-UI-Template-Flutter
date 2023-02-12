import 'package:ecommerce_template/cubit/cart_cubit.dart';
import 'package:ecommerce_template/model/product.dart';
import 'package:ecommerce_template/widget/animated_bubble.dart';
import 'package:ecommerce_template/widget/star_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  final int quantityInCart;
  final bool animate;
  final bool isFavorite;

  const ProductListTile({
    required this.product,
    required this.quantityInCart,
    required this.animate,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    final themeData = Theme.of(context);
    final titleSmall = themeData.textTheme.titleSmall;
    final bodyMedium = themeData.textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/productdetail", arguments: product.id);
            },
            child: Container(
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: themeData.cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        "assets/${product.firstImage}.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              StarRatingBar(
                                rating: product.averageRating,
                                size: 16.0,
                              ),
                              Text(
                                product.name,
                                style: bodyMedium,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                NumberFormat.currency(symbol: '\$')
                                    .format(product.price),
                                style: titleSmall,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (product.isSimple) {
                            cubit.addItem(product.id, product.price);
                          } else {
                            Navigator.of(context).pushNamed("/productdetail",
                                arguments: product.id);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                            ),
                            color: themeData.colorScheme.primary,
                          ),
                          height: 80.0,
                          width: 60.0,
                          child: Icon(
                            product.isSimple
                                ? Icons.add_shopping_cart
                                : Icons.chevron_right,
                            size: 24.0,
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isFavorite,
            child: Positioned(
              right: 12.0,
              top: 12.0,
              child: Icon(Icons.favorite,
                  color: themeData.colorScheme.primary, size: 30.0),
            ),
          ),
          Visibility(
            visible: product.onSale,
            child: Positioned(
              left: 12.0,
              bottom: 92.0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const Icon(Icons.local_offer,
                      color: Colors.green, size: 30.0),
                  Text('%', style: bodyMedium?.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
          Visibility(
            visible: quantityInCart > 0,
            child: Positioned(
              right: 13.0,
              bottom: 63.0,
              child: AnimatedBubble(quantity: quantityInCart, animate: animate),
            ),
          ),
        ],
      ),
    );
  }
}
