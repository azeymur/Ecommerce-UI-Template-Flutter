import 'package:ecommerce_template/model/entity.dart';

// Type represent variant entity
class Variant extends Entity {
  // Name of the variant
  final String name;
  // Value for the variant;
  final String value;
  // Id of the associated product
  final String productId;
  // True, if the variant is available
  final bool isAvailable;
  // True, if the variant is default
  final bool isDefault;

  const Variant({
    required super.id,
    required this.name,
    required this.value,
    required this.productId,
    required this.isAvailable,
    required this.isDefault,
  });

  @override
  String toString() {
    return "$name : $value";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        value,
        productId,
        isAvailable,
        isDefault,
      ];
}
