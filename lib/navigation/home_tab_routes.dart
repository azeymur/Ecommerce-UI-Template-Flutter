import 'package:ecommerce_template/cubit/product_detail_cubit.dart';
import 'package:ecommerce_template/page/home_page.dart';
import 'package:ecommerce_template/page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/productdetail":
        return MaterialPageRoute(
          builder: (_) {
            final productId = settings.arguments as String;
            return BlocProvider(
              create: (_) => ProductDetailCubit(),
              child: ProductDetailPage(productId),
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
