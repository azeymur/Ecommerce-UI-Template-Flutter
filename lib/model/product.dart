import 'package:ecommerce_template/model/entity.dart';

class Product extends Entity {
  // Name of the pproduct
  final String name;
  // Description for the product
  final String description;
  // Current price of the product;
  final double price;
  // Regular price of the product
  final double regularPrice;
  // True, if product is featured
  final bool isFeatured;
  // True, if product is new
  final bool isNew;
  // True, if product is popular
  final bool isPopular;
  // List of ids of associated categories
  final List<String> categoryIds;
  // List of associated tags
  final List<String> tags;
  // List of images
  final List<String> images;
  // List of ids of related products
  final List<String> relatedIds;
  // Color for the product
  final String color;
  // Material for the product
  final String material;
  // Average rating of the product
  final double averageRating;
  // Number of the ratings
  final int ratingCount;
  // True, if product has no variant
  final bool isSimple;
  // True if it is fovorite item for the logged customer
  final bool isFavorite;
  // Number of items in shopping cart
  final int qtyInCart;

  // Calculated field: Get the first image of the product
  String get firstImage {
    return images.isNotEmpty ? images[0] : "no_iamge";
  }

  // Calculated field: True, if it's on sale
  bool get onSale {
    return price != regularPrice;
  }

  // Calculated field: True, if the product has variants
  bool get isComplex {
    return !isSimple;
  }

  // Calculated field: True, if the product has added to cart
  bool get hasAddedCart {
    return qtyInCart > 0;
  }

  // Calculated field: Discount rate as percentage
  int get discountRate {
    if (price == regularPrice) return 0;

    return (((regularPrice - price) / regularPrice) * 100).round();
  }

  const Product(
      {required super.id,
      required this.name,
      required this.description,
      required this.price,
      required this.regularPrice,
      required this.isFeatured,
      required this.isNew,
      required this.isPopular,
      required this.categoryIds,
      required this.tags,
      required this.images,
      required this.relatedIds,
      required this.color,
      required this.material,
      this.averageRating = 0.0,
      this.ratingCount = 0,
      this.isSimple = false,
      this.isFavorite = false,
      this.qtyInCart = 0});

  Product copyWith({
    double? averageRating,
    int? ratingCount,
    bool? isSimple,
    bool? isFavorite,
    int? qtyInCart,
  }) {
    return Product(
        id: id,
        name: name,
        description: description,
        price: price,
        regularPrice: regularPrice,
        isFeatured: isFeatured,
        isNew: isNew,
        isPopular: isPopular,
        categoryIds: categoryIds,
        tags: tags,
        images: images,
        relatedIds: relatedIds,
        color: color,
        material: material,
        averageRating: averageRating ?? this.averageRating,
        ratingCount: ratingCount ?? this.ratingCount,
        isSimple: isSimple ?? this.isSimple,
        isFavorite: isFavorite ?? this.isFavorite,
        qtyInCart: qtyInCart ?? this.qtyInCart);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        regularPrice,
        isFeatured,
        isNew,
        isPopular,
        categoryIds,
        tags,
        images,
        relatedIds,
        color,
        material,
        averageRating,
        ratingCount,
        isSimple,
        isFavorite,
        qtyInCart
      ];
}
