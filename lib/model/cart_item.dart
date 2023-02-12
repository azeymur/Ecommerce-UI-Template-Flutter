import 'package:ecommerce_template/model/entity.dart';

// Type represent item entity of the shopping cart
class CartItem extends Entity {
  // Id of the associated product
  final String productId;
  // Unit price of the associated product
  final double unitPrice;
  // When the item added
  final DateTime dateGmt;
  // Number of items in the cart
  final int quantity;
  // Name of the associated product
  final String productName;
  // Description of the associated product
  final String productDescription;
  // Image of the associated product
  final String productImage;
  // The id of the associated variant, if exist
  final String variantId;
  // Variant value ready to be displayed
  final String variantString;

  // Calculated total value
  double get total {
    return unitPrice * quantity;
  }

  const CartItem({
    required super.id,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
    required this.dateGmt,
    this.productName = "",
    this.productDescription = "",
    this.productImage = "no_image",
    this.variantId = "",
    this.variantString = "",
  });

  CartItem copyWith(
      {int? quantity,
      String? productName,
      String? productDescription,
      String? productImage,
      String? variantString}) {
    return CartItem(
      id: id,
      productId: productId,
      unitPrice: unitPrice,
      dateGmt: dateGmt,
      variantId: variantId,
      quantity: quantity ?? this.quantity,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      productImage: productImage ?? this.productImage,
      variantString: variantString ?? this.variantString,
    );
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        unitPrice,
        dateGmt,
        quantity,
        productName,
        productDescription,
        productImage,
        variantId,
        variantString,
      ];
}
