import 'package:ecommerce_template/globals.dart';
import 'package:ecommerce_template/locator.dart';
import 'package:ecommerce_template/model/product.dart';
import 'package:ecommerce_template/service/service.dart';
import 'package:ecommerce_template/widget/picker_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final Service service = getIt<Service>();

  ProductDetailCubit() : super(const InitialProductDetailState());

  void getProduct(String productId) async {
    final product =
        await service.getProduct(Globals.loggedCustomerId, productId);
    final relatedItems = await service.getProducts(Globals.loggedCustomerId,
        productIds: product.relatedIds);
    final sizeValues = (await service.getVariants("Size", productId))
        .map<PickerItem>((i) =>
            PickerItem(i.value, i.id, i.isDefault, isAvailable: i.isAvailable))
        .toList();

    emit(LoadedProductDetailState(product, relatedItems, sizeValues));
  }

  void getRelatedItems(List<String> productIds) async {
    final loadedState = state as LoadedProductDetailState;
    final relatedItems = await service.getProducts(Globals.loggedCustomerId,
        productIds: productIds);

    emit(LoadedProductDetailState(
        loadedState.product, relatedItems, loadedState.sizeValues));
  }

  void photoBrowser(BuildContext context, String initialImage) {}

  void showReview(BuildContext context) {}

}

@immutable
abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
}

class InitialProductDetailState extends ProductDetailState {
  const InitialProductDetailState();

  @override
  List<Object?> get props => [];
}

class LoadedProductDetailState extends ProductDetailState {
  final Product product;
  final List<Product> relatedItems;
  final List<PickerItem> sizeValues;

  const LoadedProductDetailState(
      this.product, this.relatedItems, this.sizeValues);

  @override
  List<Object?> get props => [product, relatedItems, sizeValues];
}
