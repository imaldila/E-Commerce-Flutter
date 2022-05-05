import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../constant.dart';
import '../models/models.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  final String screen;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.amberAccent,
      child: SizedBox(
        height: 70,
        child: (screen == '/product')
            ? AddToCartNavBar(product: product!)
            : (screen == '/cart')
                ? const GoToCheckoutNavBar()
                : const HomeNavBar(),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<WishlistBloc>().add(AddWishlistProduct(product));

                const snackBar =
                    SnackBar(content: Text('Added to Your Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            );
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
                Navigator.pushNamed(context, '/cart');
              },
              child: Text(
                'Add to Cart',
                style: kTextStyle18Bold,
              ),
            );
          },
        ),
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          child: Text(
            'GO TO CHECKOUT',
            style: kTextStyle18Bold,
          ),
        ),
      ],
    );
  }
}
