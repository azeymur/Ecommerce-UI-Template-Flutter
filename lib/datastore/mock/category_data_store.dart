import 'package:ecommerce_template/datastore/mock/mock_data_store.dart';
import 'package:ecommerce_template/model/category.dart';

//Mock data store with fake entities to test.
class CategoryDataStore extends MockDataStore<Category> {
  @override
  List<Category> items = const [
    Category(
      id: "c001",
      name: "Accesories",
      image: "cat_accessories",
    ),
    Category(
      id: "c002",
      name: "Hoodies",
      image: "cat_hoodies",
    ),
    Category(id: "c003", name: "Sweaters", image: "cat_sweaters"),
    Category(
      id: "c004",
      name: "Pants",
      image: "cat_pants",
    ),
    Category(
      id: "c005",
      name: "Others",
      image: "cat_others",
    ),
  ];
}
