import 'package:ecommerce_template/cubit/cart_cubit.dart';
import 'package:ecommerce_template/cubit/favorite_cubit.dart';
import 'package:ecommerce_template/cubit/home_cubit.dart';
import 'package:ecommerce_template/cubit/my_account_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  BlocProviders._();

  static get getProviders => [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => MyAccountCubit()),
        BlocProvider(create: (_) => CartCubit()..getCartItems()),
        BlocProvider(create: (_) => FavoriteCubit()..getFavorites()),
      ];
}
