import 'package:ecommerce_template/locator.dart';
import 'package:ecommerce_template/model/cart_item.dart';
import 'package:ecommerce_template/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final Service service = getIt<Service>();

  CartCubit() : super(CartState.empty());

  void getCartItems() async {
    final cartItems = await service.getCartItems();
    emit(CartState(cartItems));
  }

  void addItem(String productId, unitPrice, {String? variantId}) async {
    await service.addCartItem(productId, unitPrice, 1, variantId: variantId);
    final cartItems = await service.getCartItems();
    emit(CartState(cartItems, selectedItemId: productId));
  }

  void updateCartItem(CartItem item) async {
    await service.updateCartItem(item.id, item.quantity + 1);
    final cartItems = await service.getCartItems();
    emit(CartState(cartItems, selectedItemId: item.id));
  }

  void removeCartItem(CartItem item) async {
    await service.updateCartItem(item.id, item.quantity - 1);
    final cartItems = await service.getCartItems();
    emit(CartState(cartItems, selectedItemId: item.id));
  }

  void deleteCartItem(CartItem item) async {
    await service.deleteCartItem(item.id);
    final cartItems = await service.getCartItems();
    emit(CartState(cartItems));
  }

  void deleteAll() async {
    await service.deleteAllCartItems();
    emit(CartState.empty());
  }
}

class CartState extends Equatable {
  final List<CartItem> cartItems;
  final String selectedItemId;

  double get cartTotal =>
      cartItems.fold<double>(0, (previous, item) => previous + item.total);

  const CartState(this.cartItems, {this.selectedItemId = ""});

  factory CartState.empty() {
    return const CartState([]);
  }

  @override
  List<Object?> get props => [cartItems, selectedItemId];
}
