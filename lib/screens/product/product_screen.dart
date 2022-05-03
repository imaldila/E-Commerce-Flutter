import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_bloc/blocs/blocs.dart';
import 'package:e_commerce_bloc/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
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
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product));

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
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              // enableInfiniteScroll: false,
              // autoPlay: true,
            ),
            items: [
              CardHeroCarousel(
                product: product,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorPad),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kHorPad),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: kTextStyle12White,
                        ),
                        Text(
                          '\$ ${product.price}',
                          style: kTextStyle12White,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorPad),
            child: ExpansionTile(
              title: Text('Product Information', style: kTextStyle18Bold),
              children: const [
                ListTile(
                  title: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorPad),
            child: ExpansionTile(
              title: Text('Delivery Information', style: kTextStyle18Bold),
              children: const [
                ListTile(
                  title: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
