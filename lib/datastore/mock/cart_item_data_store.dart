import 'package:ecommerce_template/datastore/mock/mock_data_store.dart';
import 'package:ecommerce_template/model/cart_item.dart';

//Mock data store with fake entities to test.
class CartItemDataStore extends MockDataStore<CartItem> {
  @override
  List<CartItem> items = [
    CartItem(
      id: "cl001",
      productId: "p001",
      unitPrice: 18.0,
      quantity: 2,
      dateGmt: DateTime(2021, 05, 07)
    ),
    CartItem(
      id: "cl002",
      productId: "p010",
      variantId: "v008",
      unitPrice: 42.0,
      quantity: 1,
      dateGmt: DateTime(2021,05,03),
    ),
  ];
}
