import 'package:ecommerce_template/globals.dart';
import 'package:ecommerce_template/locator.dart';
import 'package:ecommerce_template/model/favorite.dart';
import 'package:ecommerce_template/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final Service service = getIt<Service>();

  FavoriteCubit() : super(FavoriteState.empty());

  void getFavorites() async {
    final favorites = await service.getFavorites(Globals.loggedCustomerId);
    emit(FavoriteState(favorites));
  }

  void toggleFavorite(String productId) async {
    final favorite =
        await service.getFavorite(Globals.loggedCustomerId, productId);

    if (favorite != null) {
      await service.deleteFavorite(favorite.id);
    } else {
      await service.addFavorite(Globals.loggedCustomerId, productId);
    }

    final favorites = await service.getFavorites(Globals.loggedCustomerId);
    emit(FavoriteState(favorites));
  }
}

class FavoriteState extends Equatable {
  final List<Favorite> favorites;

  const FavoriteState(this.favorites);

  factory FavoriteState.empty() {
    return const FavoriteState([]);
  }

  @override
  List<Object?> get props => [favorites];
}
