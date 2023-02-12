import 'package:ecommerce_template/app_theme.dart';
import 'package:ecommerce_template/cubit/cart_cubit.dart';
import 'package:ecommerce_template/cubit/favorite_cubit.dart';
import 'package:ecommerce_template/cubit/product_detail_cubit.dart';
import 'package:ecommerce_template/localization/locals.dart';
import 'package:ecommerce_template/model/product.dart';
import 'package:ecommerce_template/widget/animated_bubble.dart';
import 'package:ecommerce_template/widget/horizontal_list_single_picker.dart';
import 'package:ecommerce_template/widget/loading.dart';
import 'package:ecommerce_template/widget/picker_item.dart';
import 'package:ecommerce_template/widget/product_list_tile.dart';
import 'package:ecommerce_template/widget/star_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage(this.productId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();
    final cartCubit = context.read<CartCubit>();
    final locals = Locals.of(context);

    String? selectedSizeId;

    cubit.getProduct(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.productDetail),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('/', ModalRoute.withName("/")),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is InitialProductDetailState) {
            return const Loading();
          } else {
            state as LoadedProductDetailState;

            if (state.sizeValues.isNotEmpty) {
              selectedSizeId =
                  state.sizeValues.firstWhere((item) => item.selected).value;
            } else {
              selectedSizeId = null;
            }

            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _productImagesPager(context, state.product.images),
                      _productDetails(context, state.product, state.sizeValues,
                          (value) => selectedSizeId = value),
                      _relatedItems(state),
                      const SizedBox(height: 98.0),
                    ],
                  ),
                ),
                _bottomPanel(
                  context,
                  state.product,
                  () {
                    cartCubit.addItem(productId, state.product.price,
                        variantId: selectedSizeId);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _productImagesPager(BuildContext context, List<String> images) {
    final cubit = context.read<ProductDetailCubit>();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: PageView.builder(
          pageSnapping: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                cubit.photoBrowser(context, images[index]);
              },
              child: Image.asset(
                "assets/${images[index]}.jpg",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _productDetails(
      BuildContext context,
      Product product,
      List<PickerItem> sizeValues,
      void Function(String value) sizeTappedCallback) {
    final cubit = context.read<ProductDetailCubit>();
    final locals = Locals.of(context);
    final themeData = Theme.of(context);
    final titleMedium = themeData.textTheme.titleMedium;
    final titleLarge = themeData.textTheme.titleLarge;
    final boldTitleMedium = titleMedium?.copyWith(fontWeight: FontWeight.bold);
    final bodyMedium = themeData.textTheme.bodyMedium;
    final boldHeadlineSmall = themeData.textTheme.headlineSmall
        ?.copyWith(fontWeight: FontWeight.bold);
    final accentTitleLarge = titleLarge?.copyWith(
        color: themeData.colorScheme.primary,
        decoration: TextDecoration.underline);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(product.name, style: boldHeadlineSmall),
          const SizedBox(height: 16.0),
          Row(
            children: [
              StarRatingBar(
                rating: product.averageRating,
                size: 26.0,
              ),
              Text(
                "(${product.ratingCount})",
                style: titleMedium,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => cubit.showReview(context),
                child: Text(
                  locals.showReviews,
                  style: accentTitleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Visibility(
            visible: !product.isSimple,
            child: HorizontalListSinglePicker(
              items: sizeValues,
              itemTappedCallback: sizeTappedCallback,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(product.description, style: bodyMedium),
          const SizedBox(height: 16.0),
          Text(locals.relatedItems, style: boldTitleMedium),
        ],
      ),
    );
  }

  Widget _relatedItems(LoadedProductDetailState state) {
    return SizedBox(
      height: 256.0,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) {
          return BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, favState) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                scrollDirection: Axis.horizontal,
                itemCount: state.relatedItems.length,
                itemBuilder: (context, index) {
                  final product = state.relatedItems[index];
                  return ProductListTile(
                    product: product,
                    animate: cartState.selectedItemId == product.id,
                    quantityInCart: cartState.cartItems
                        .where((item) => item.productId == product.id)
                        .fold(0, (previous, item) => previous + item.quantity),
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
    );
  }

  Widget _bottomPanel(
      BuildContext context, Product product, void Function() addCartCallback) {
    final favCubit = context.read<FavoriteCubit>();
    final locals = Locals.of(context);
    final themeData = Theme.of(context);
    final titleLarge = themeData.textTheme.titleLarge;
    final bodyMedium = themeData.textTheme.bodyMedium;
    final currency = NumberFormat.currency(symbol: '\$');

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(.4),
              ),
            ],
            color: themeData.cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Row(
            children: [
              Visibility(
                visible: product.discountRate != 0,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const Icon(
                      Icons.local_offer,
                      size: 50.0,
                      color: Colors.green,
                    ),
                    Text("%${product.discountRate}",
                        style: bodyMedium?.copyWith(color: Colors.white))
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(currency.format(product.price), style: titleLarge),
                  Visibility(
                    visible: product.regularPrice != product.price,
                    child: Text(
                      currency.format(product.regularPrice),
                      style: bodyMedium?.copyWith(
                          decoration: TextDecoration.lineThrough),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: () {
                  favCubit.toggleFavorite(productId);
                },
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, favState) {
                    return Icon(
                      favState.favorites
                              .any((item) => item.productId == productId)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      size: 50.0,
                      color: themeData.colorScheme.primary,
                    );
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: addCartCallback,
                  style: AppTheme.stadiumElevatedButton,
                  child: Text(locals.addCart),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            final quantityInCart = cartState.cartItems
                .where((item) => item.productId == productId)
                .fold(0, (previous, item) => previous + item.quantity);

            return Visibility(
              visible: quantityInCart > 0,
              child: Positioned(
                right: 120.0,
                bottom: 23.0,
                child: AnimatedBubble(
                  quantity: quantityInCart,
                  animate: true,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
