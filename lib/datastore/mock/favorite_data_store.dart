import 'package:ecommerce_template/datastore/mock/mock_data_store.dart';
import 'package:ecommerce_template/model/favorite.dart';

// Mock data store with fake entities to test.
class FavoriteDataStore extends MockDataStore<Favorite> {
  @override
  List<Favorite> items = [
    const Favorite(
      id: "fav001",
      customerId: "cu001",
      productId: "p001",
    ),
    const Favorite(
      id: "fav002",
      customerId: "cu001",
      productId: "p007",
    ),
    const Favorite(
      id: "fav003",
      customerId: "cu001",
      productId: "p008",
    ),
  ];
}
