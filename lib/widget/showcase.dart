import 'package:ecommerce_template/cubit/cart_cubit.dart';
import 'package:ecommerce_template/cubit/favorite_cubit.dart';
import 'package:ecommerce_template/localization/locals.dart';
import 'package:ecommerce_template/model/product.dart';
import 'package:ecommerce_template/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Showcase extends StatelessWidget {
  final String title;
  final List<Product> products;
  final void Function() callback;

  const Showcase(
      {required this.title,
      required this.products,
      required this.callback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleLarge = themeData.textTheme.titleLarge;

    final locals = Locals.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(title, style: titleLarge),
              const Spacer(),
              GestureDetector(
                onTap: callback,
                child: Text(
                  locals.showAll,
                  style: titleLarge?.copyWith(
                    color: themeData.colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 256.0,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              return BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, favState) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return ProductListTile(
                        product: product,
                        animate: cartState.selectedItemId == product.id,
                        quantityInCart: cartState.cartItems
                            .where((item) => item.productId == product.id)
                            .fold(0,
                                (previous, item) => previous + item.quantity),
                        isFavorite: favState.favorites
                            .any((item) => item.productId == product.id),
                        key: UniqueKey(),
                      );
                    },
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
