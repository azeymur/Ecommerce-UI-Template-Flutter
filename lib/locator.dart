import 'package:ecommerce_template/datastore/mock/address_data_store.dart';
import 'package:ecommerce_template/datastore/mock/poster_data_store.dart';
import 'package:ecommerce_template/datastore/mock/cart_item_data_store.dart';
import 'package:ecommerce_template/datastore/mock/category_data_store.dart';
import 'package:ecommerce_template/datastore/mock/customer_data_store.dart';
import 'package:ecommerce_template/datastore/mock/favorite_data_store.dart';
import 'package:ecommerce_template/datastore/mock/product_data_store.dart';
import 'package:ecommerce_template/datastore/mock/rating_data_store.dart';
import 'package:ecommerce_template/datastore/mock/variant_data_store.dart';
import 'package:ecommerce_template/service/service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AddressDataStore>(AddressDataStore());
  getIt.registerSingleton<PosterDataStore>(PosterDataStore());
  getIt.registerSingleton<CartItemDataStore>(CartItemDataStore());
  getIt.registerSingleton<CategoryDataStore>(CategoryDataStore());
  getIt.registerSingleton<CustomerDataStore>(CustomerDataStore());
  getIt.registerSingleton<FavoriteDataStore>(FavoriteDataStore());
  getIt.registerSingleton<ProductDataStore>(ProductDataStore());
  getIt.registerSingleton<RatingDataStore>(RatingDataStore());
  getIt.registerSingleton<VariantDataStore>(VariantDataStore());
  
  getIt.registerFactory(() => Service());
}
