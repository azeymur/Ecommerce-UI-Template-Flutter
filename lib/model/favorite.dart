import 'package:ecommerce_template/model/entity.dart';

// Type represent favorite entity
class Favorite extends Entity {
  // The id of the associated customer
  final String customerId;
  // The id of the associated product
  final String productId;

  const Favorite({
    required super.id,
    required this.customerId,
    required this.productId,
  });

  @override
  List<Object?> get props => [id, customerId, productId];
}
