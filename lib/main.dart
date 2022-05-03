import 'package:e_commerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_bloc/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
            create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider<CartBloc>(
            create: (_) => CartBloc()..add(LoadCart())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
