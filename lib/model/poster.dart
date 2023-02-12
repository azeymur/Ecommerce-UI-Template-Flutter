import 'package:ecommerce_template/model/entity.dart';

// Type represent poster entity
class Poster extends Entity {
  // Name of the image fot the poster
  final String image;
  //When poster is touched, the route to go.
  final String parameterName;
  final String parameterValue;

  const Poster({
    required super.id,
    required this.image,
    required this.parameterName,
    required this.parameterValue,
  });

  @override
  List<Object?> get props => [id, image, parameterName, parameterValue];
}
