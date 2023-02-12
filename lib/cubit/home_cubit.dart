import 'package:ecommerce_template/globals.dart';
import 'package:ecommerce_template/locator.dart';
import 'package:ecommerce_template/model/category.dart';
import 'package:ecommerce_template/model/poster.dart';
import 'package:ecommerce_template/model/product.dart';
import 'package:ecommerce_template/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final Service service = getIt<Service>();

  HomeCubit() : super(const InitialHomeState());

  void load() async {
    final posters = await service.getPosters();
    final categories = await service.getCategories();
    final featuredItems =
        await service.getProducts(Globals.loggedCustomerId, onlyFeatured: true);
    final popularItems =
        await service.getProducts(Globals.loggedCustomerId, onlyPopular: true);
    final newItems =
        await service.getProducts(Globals.loggedCustomerId, onlyNew: true);

    emit(LoadedHomeState(
        posters, categories, featuredItems, popularItems, newItems));
  }
}

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  const InitialHomeState();

  @override
  List<Object?> get props => [];
}

class LoadedHomeState extends HomeState {
  final List<Poster> posters;
  final List<Category> categories;
  final List<Product> featuredItems;
  final List<Product> popularItems;
  final List<Product> newItems;

  const LoadedHomeState(
    this.posters,
    this.categories,
    this.featuredItems,
    this.popularItems,
    this.newItems,
  );

  @override
  List<Object?> get props => [
        posters,
        categories,
        featuredItems,
        popularItems,
        newItems,
      ];
}
