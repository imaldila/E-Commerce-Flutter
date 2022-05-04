import 'package:e_commerce_bloc/blocs/blocs.dart';
import 'package:e_commerce_bloc/blocs/cart/cart_bloc.dart';
import 'package:e_commerce_bloc/blocs/category/category_bloc.dart';
import 'package:e_commerce_bloc/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_bloc/config/app_router.dart';
import 'package:e_commerce_bloc/repository/category/category_repository.dart';
import 'package:e_commerce_bloc/repository/product/product_repository.dart';
import 'package:e_commerce_bloc/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
          create: (_) => WishlistBloc()
            ..add(
              StartWishlist(),
            ),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()
            ..add(
              LoadCart(),
            ),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategory()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProduct(),
            ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: CheckoutScreen.routeName,
      ),
    );
  }
}
