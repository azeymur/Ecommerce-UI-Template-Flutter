import 'package:ecommerce_template/datastore/mock/mock_data_store.dart';
import 'package:ecommerce_template/model/poster.dart';

//Mock data store with fake entities to test.
class PosterDataStore extends MockDataStore<Poster> {
  @override
  List<Poster> items = const [
    Poster(
      id: "ban004",
      image: "banner1",
      parameterName: "ProductIds",
      parameterValue: "p002,p003",
    ),
    Poster(
        id: "ban001",
        image: "banner2",
        parameterName: "CategoryIds",
        parameterValue: "c001"),
    Poster(
      id: "ban002",
      image: "banner3",
      parameterName: "Tags",
      parameterValue: "Tag1",
    ),
  ];
}
