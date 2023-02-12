import 'package:ecommerce_template/model/entity.dart';

// Type represent category entity
class Category extends Entity {
  // Name of the category
  final String name;
  // Image name for the category
  final String image;

  const Category({
    required super.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
