import 'package:ecommerce_template/datastore/mock/mock_data_store.dart';
import 'package:ecommerce_template/model/product.dart';

class ProductDataStore extends MockDataStore<Product> {
  @override
  List<Product> items = const [
     Product(
        id: "p001",
        name: "Beanie",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 18.0,
        regularPrice: 20.0,
        categoryIds: ["c001"],
        tags: ["Hood", "Cotton", "Woman"],
        color: "Black",
        material: "Cotton",
        images: ["beanie1", "beanie2"],
        isFeatured: true,
        isNew: false,
        isPopular: false,
        relatedIds: ["p003", "p002", "p004", "p005"]),

    Product(
        id: "p002",
        name: "Belt",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 55.0,
        regularPrice: 65.0,
        categoryIds: ["c001"],
        tags: ["Leather", "Man"],
        color: "Brown",
        material: "Leather",
        images: ["belt1"],
        isFeatured: false,
        isNew: false,
        isPopular: true,
        relatedIds: ["p001", "p003", "p004"]),

    Product(
        id: "p003",
        name: "Cap",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 16.0,
        regularPrice: 16.0,
        categoryIds: ["c001"],
        tags: ["Hood", "Polyester"],
        color: "Blue",
        material: "Polyester",
        images: ["cap1"],
        isFeatured: false,
        isNew: false,
        isPopular: false,
        relatedIds: ["p001", "p002", "p004", "p005"]),

    Product(
        id: "p004",
        name: "Sunglasses",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 35.0,
        regularPrice: 35.0,
        categoryIds: ["c001"],
        tags: ["Titanium"],
        color: "Green",
        material: "Titanium",
        images: ["sunglasses1", "sunglasses2"],
        isFeatured: false,
        isNew: false,
        isPopular: false,
        relatedIds: ["p005", "p003", "p002", "p001"]),

    Product(
        id: "p005",
        name: "Sunglasses Orange",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 30.0,
        regularPrice: 40.0,
        categoryIds: ["c001"],
        tags: ["Metal"],
        color: "Orange",
        material: "Metal",
        images: ["sunglasses_orange1", "sunglasses_orange2"],
        isFeatured: false,
        isNew: true,
        isPopular: false,
        relatedIds: ["p004", "p003", "p001", "p002"]),

    // Sweaters

    Product(
        id: "p006",
        name: "Corduroy Sweater",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 32.0,
        regularPrice: 32.0,
        categoryIds: ["c003"],
        tags: ["Corduroy", "Woman"],
        color: "Dark Gray",
        material: "Corduroy",
        images: ["corduroy_sweater1"],
        isFeatured: false,
        isNew: false,
        isPopular: false,
        relatedIds: ["p007", "p008", "p009"]),

    Product(
        id: "p007",
        name: "Long Sleeve Sweater",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 25.0,
        regularPrice: 25.0,
        categoryIds: ["c003"],
        tags: ["Wool", "Woman"],
        color: "Smoke White",
        material: "Wool",
        images: [
          "long_sleeve_sweater1",
          "long_sleeve_sweater2",
          "long_sleeve_sweater3"
        ],
        isFeatured: false,
        isNew: false,
        isPopular: true,
        relatedIds: ["p007", "p008", "p009"]),

    Product(
        id: "p008",
        name: "V-neck Knit Shirt",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 20.0,
        regularPrice: 20.0,
        categoryIds: ["c003"],
        tags: ["Wool", "V-neck", "Woman"],
        color: "Brown",
        material: "Wool",
        images: ["vneck_knit_shirt1"],
        isFeatured: true,
        isNew: true,
        isPopular: false,
        relatedIds: ["p009", "p007", "p006"]),

    // Others

    Product(
        id: "p009",
        name: "Woollen Pancho",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 40.0,
        regularPrice: 50.0,
        categoryIds: ["c005"],
        tags: ["Wool", "Pancho", "Woman"],
        color: "Black&White",
        material: "Wool",
        images: ["woollen_pancho1", "woollen_pancho2", "woollen_pancho3"],
        isFeatured: false,
        isNew: false,
        isPopular: true,
        relatedIds: ["p008", "p007", "p006"]),

    // Hoodies

    Product(
        id: "p010",
        name: "Hoodie",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 42.0,
        regularPrice: 45.0,
        categoryIds: ["c002"],
        tags: ["Cotton", "Man"],
        color: "Orange",
        material: "Cotton",
        images: ["hoodie1"],
        isFeatured: true,
        isNew: true,
        isPopular: false,
        relatedIds: ["p011", "p012", "p013"]),

    Product(
        id: "p011",
        name: "Hoodie with Pocket",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 35.0,
        regularPrice: 45.0,
        categoryIds: ["c002"],
        tags: ["Linen", "Woman"],
        color: "Lime",
        material: "Linen",
        images: ["hoodie_pocket1", "hoodie_pocket2", "hoodie_pocket3"],
        isFeatured: true,
        isNew: true,
        isPopular: false,
        relatedIds: ["p013", "p012", "p010"]),

    Product(
        id: "p012",
        name: "Hoodie with Zipper",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 45.0,
        regularPrice: 45.0,
        categoryIds: ["c002"],
        tags: ["Cotton", "Woman"],
        color: "Black",
        material: "Cotton",
        images: ["hoodie_zipper1"],
        isFeatured: false,
        isNew: false,
        isPopular: true,
        relatedIds: ["p013", "p010", "p011"]),

    Product(
        id: "p013",
        name: "Hoodie with Logo",
        description:
            "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nVestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\n\nAliquam porttitor magna eget mauris lobortis gravida. Integer volutpat ligula sed semper vulputate. Donec tincidunt lobortis leo, at lacinia lectus semper non. In laoreet fringilla felis in posuere. Maecenas a turpis tincidunt, aliquet justo vel, tristique diam. Duis sit amet tristique tellus. Maecenas vel lectus justo. Curabitur tellus augue, ultrices nec dignissim maximus, bibendum accumsan lacus.\n\nInteger elementum pulvinar semper. Fusce a metus semper, suscipit erat in, aliquet mauris.",
        price: 45.0,
        regularPrice: 45.0,
        categoryIds: ["c002"],
        tags: ["Wool", "Man"],
        color: "White",
        material: "Wool",
        images: ["hoodie_logo1"],
        isFeatured: false,
        isNew: false,
        isPopular: true,
        relatedIds: ["p012", "p011", "p010"]),
  ];
}
