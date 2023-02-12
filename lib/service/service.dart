import 'package:ecommerce_template/datastore/data_store.dart';
import 'package:ecommerce_template/datastore/mock/address_data_store.dart';
import 'package:ecommerce_template/datastore/mock/poster_data_store.dart';
import 'package:ecommerce_template/datastore/mock/cart_item_data_store.dart';
import 'package:ecommerce_template/datastore/mock/category_data_store.dart';
import 'package:ecommerce_template/datastore/mock/customer_data_store.dart';
import 'package:ecommerce_template/datastore/mock/favorite_data_store.dart';
import 'package:ecommerce_template/datastore/mock/product_data_store.dart';
import 'package:ecommerce_template/datastore/mock/rating_data_store.dart';
import 'package:ecommerce_template/datastore/mock/variant_data_store.dart';
import 'package:ecommerce_template/locator.dart';
import 'package:ecommerce_template/model/address.dart';
import 'package:ecommerce_template/model/poster.dart';
import 'package:ecommerce_template/model/cart_item.dart';
import 'package:ecommerce_template/model/category.dart';
import 'package:ecommerce_template/model/customer.dart';
import 'package:ecommerce_template/model/favorite.dart';
import 'package:ecommerce_template/model/product.dart';
import 'package:ecommerce_template/model/rating.dart';
import 'package:ecommerce_template/model/variant.dart';
import 'package:ecommerce_template/service/sort_by.dart';
import 'package:uuid/uuid.dart';

//Mock service that works with mock data stores for testing.
class Service {
  DataStore<Address> dataAddress = getIt<AddressDataStore>();
  DataStore<Poster> dataPoster = getIt<PosterDataStore>();
  DataStore<CartItem> dataCartItem = getIt<CartItemDataStore>();
  DataStore<Category> dataCategory = getIt<CategoryDataStore>();
  DataStore<Customer> dataCustomer = getIt<CustomerDataStore>();
  DataStore<Favorite> dataFavorite = getIt<FavoriteDataStore>();
  DataStore<Product> dataProduct = getIt<ProductDataStore>();
  DataStore<Rating> dataRating = getIt<RatingDataStore>();
  DataStore<Variant> dataVariant = getIt<VariantDataStore>();
  
  // Methods for Customer entity

  Future<Customer> getCustomer(String id) async {
    return await dataCustomer.get(id);
  }

  Future<bool> updateCustomer(
    String id,
    String fullName,
    String username,
    String email, {
    String image = "no_image",
    String phone = "",
  }) async {
    final customer = Customer(
        id: id,
        fullName: fullName,
        username: username,
        email: email,
        image: image);

    return await  dataCustomer.update(customer);
  }

  // Methods for CartItem entity

  Future<CartItem> getCartItem(String id) async {
    final item = await dataCartItem.get(id);
    final product = await dataProduct.get(item.productId);

    return item.copyWith(
      productName: product.name,
      productDescription: product.description,
      productImage: product.firstImage,
      variantString: item.variantId.isNotEmpty
          ? (await dataVariant.get(item.variantId)).toString()
          : null,
    );
  }

  Future<CartItem> addCartItem(
    String productId,
    double unitPrice,
    int quantity, {
    String? variantId,
  }) async {
    final result = await dataCartItem.getBy((i) =>
        i.productId == productId &&
        (variantId == null || i.variantId == variantId) &&
        i.unitPrice == unitPrice);

    if (result.isEmpty) {
      final newItem = CartItem(
        id: const Uuid().v4(),
        productId: productId,
        unitPrice: unitPrice,
        quantity: quantity,
        dateGmt: DateTime.now().toUtc(),
        variantId: variantId ?? "",
      );

      return await dataCartItem.add(newItem);
    } else {
      final oldItem = result.first;
      final newItem = oldItem.copyWith(quantity: quantity + oldItem.quantity);
      await dataCartItem.update(newItem);
      return newItem;
    }
  }

  Future<List<CartItem>> getCartItems() async {
    List<CartItem> cartItems = [];

    final results = await dataCartItem.getAll();

    for (var item in results) {
      final product = await dataProduct.get(item.productId);

      cartItems.add(
        item.copyWith(
          productName: product.name,
          productDescription: product.description,
          productImage: product.firstImage,
          variantString: item.variantId.isNotEmpty
              ? (await dataVariant.get(item.variantId)).toString()
              : null,
        ),
      );
    }

    cartItems.sort((a, b) => a.dateGmt.compareTo(b.dateGmt));

    return cartItems;
  }

    Future<bool> updateCartItem(String id, int quantity) async {
    final oldItem = await dataCartItem.get(id);
    final newItem = oldItem.copyWith(quantity: quantity);

    return await dataCartItem.update(newItem);
  }

  Future<bool> deleteCartItem(String id) async {
    return await dataCartItem.delete(id);
  }

  Future<bool> deleteAllCartItems() async {
    return await dataCartItem.deleteAll();
  }

  // Methods for Category entity

  Future<List<Category>> getCategories({String? name}) async {
    final result = await dataCategory.getBy((i) =>
        name == null || i.name.toLowerCase().contains(name.toLowerCase()));
    final categories = result.toList();
    categories.sort((a, b) => a.name.compareTo(b.name));

    return categories;
  }

  // Methods for Product entity

  Future<Product> getProduct(String customerId, String id) async {
    final item = await dataProduct.get(id);

    int ratingCount = 0;
    double averageRating = 0.0;
    bool isFavorite = false;
    bool isSimple = false;
    int qtyInCart = 0;

    ratingCount =
        (await dataRating.getBy((r) => r.productId == item.id)).length;

    if (ratingCount == 0) {
      averageRating = 0;
    } else {
      final int totalStar =
          (await dataRating.getBy((r) => r.productId == item.id))
              .fold(0, (previous, item) => previous + item.star);
      averageRating = totalStar / ratingCount;
    }

    isFavorite = await dataFavorite
        .isExist((f) => f.customerId == customerId && f.productId == item.id);

    qtyInCart = (await dataCartItem.getBy((i) => i.productId == item.id))
        .fold(0, (previous, item) => previous + item.quantity);

    isSimple = !(await dataVariant.isExist((v) => v.productId == item.id));

    final product = item.copyWith(
        averageRating: averageRating,
        ratingCount: ratingCount,
        isSimple: isSimple,
        isFavorite: isFavorite,
        qtyInCart: qtyInCart);

    return product;
  }

  Future<List<Product>> getProducts(
    String customerId, {
    List<String>? categoryIds,
    List<String>? tags,
    List<String>? productIds,
    List<String>? colors,
    List<String>? materials,
    String? key,
    bool onlyFavorites = false,
    bool onlyNew = false,
    bool onlyFeatured = false,
    bool onlyPopular = false,
    SortBy sortBy = SortBy.unsorted,
  }) async {
    List<Product> products = [];

    final results = await dataProduct.getBy((p) =>
        (categoryIds == null ||
            p.categoryIds.any((c) => categoryIds.contains(c))) &&
        (tags == null || p.tags.any((t) => tags.contains(t))) &&
        (productIds == null || productIds.contains(p.id)) &&
        (colors == null || colors.any((c) => c == p.color)) &&
        (materials == null || materials.any((m) => m == p.material)) &&
        (key == null || p.name.toLowerCase().contains(key.toLowerCase())) &&
        (onlyNew == false || p.isNew) &&
        (onlyFeatured == false || p.isFeatured) &&
        (onlyPopular == false || p.isPopular));

    for (var item in results) {
      int ratingCount = 0;
      double averageRating = 0.0;
      bool isFavorite = false;
      bool isSimple = false;
      int qtyInCart = 0;

      ratingCount =
          (await dataRating.getBy((r) => r.productId == item.id)).length;

      if (ratingCount == 0) {
        averageRating = 0;
      } else {
        final int totalStar =
            (await dataRating.getBy((r) => r.productId == item.id))
                .fold(0, (previous, item) => previous + item.star);
        averageRating = totalStar / ratingCount;
      }

      isFavorite = await dataFavorite
          .isExist((f) => f.customerId == customerId && f.productId == item.id);

      qtyInCart = (await dataCartItem.getBy((i) => i.productId == item.id))
          .fold(0, (previous, item) => previous + item.quantity);

      isSimple = !(await dataVariant.isExist((v) => v.productId == item.id));

      final product = item.copyWith(
          averageRating: averageRating,
          ratingCount: ratingCount,
          isSimple: isSimple,
          isFavorite: isFavorite,
          qtyInCart: qtyInCart);

      products.add(product);
    }

    products =
        products.where((p) => onlyFavorites == false || p.isFavorite).toList();

    switch (sortBy) {
      case SortBy.nameAZ:
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortBy.nameZA:
        products.sort((a, b) => b.name.compareTo(a.name));
        break;
      case SortBy.priceHigh:
        products.sort((a, b) => (b.price - a.price).round());
        break;
      case SortBy.priceLow:
        products.sort((a, b) => (a.price - b.price).round());
        break;
      case SortBy.highestRate:
        products.sort((a, b) => (b.averageRating - a.averageRating).round());
        break;
      case SortBy.rateCount:
        products.sort((a, b) => b.ratingCount - a.ratingCount);
        break;
      default:
        break;
    }

    return products;
  }

  // Methods for Poster entity

  Future<List<Poster>> getPosters() async {
    return await dataPoster.getAll();
  }

  // Methods for Favorite entity

  Future<Favorite?> getFavorite(String customerId, String productId) async {
    final favorites = await dataFavorite
        .getBy((f) => f.customerId == customerId && f.productId == productId);
    return favorites.isNotEmpty ? favorites.first : null;
  }

  Future<List<Favorite>> getFavorites(String customerId) async {
    final favorites =
        await dataFavorite.getBy((f) => f.customerId == customerId);
    return favorites.toList();
  }

  Future<Favorite> addFavorite(String customerId, String productId) async {
    final favorite = Favorite(
      id: const Uuid().v4(),
      customerId: customerId,
      productId: productId,
    );

    return await dataFavorite.add(favorite);
  }

  Future<bool> deleteFavorite(String id) async {
    return await dataFavorite.delete(id);
  }

  // Methods for Variant entity

  Future<List<Variant>> getVariants(String name, String productId) async {
    final results = await dataVariant
        .getBy((v) => v.name == name && v.productId == productId);
    final variants = results.toList();
    variants.sort((a, b) => b.name.compareTo(a.name));

    return variants;
  }

}
