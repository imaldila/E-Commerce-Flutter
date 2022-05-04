import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_bloc/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero to Unicorn',
        automaticlyImplyLeading: false,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    // enableInfiniteScroll: false,
                    // autoPlay: true,
                  ),
                  items: state.categories
                      .map((category) => CardHeroCarousel(category: category))
                      .toList(),
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
          const SizedBox(
            height: kSizeBox,
          ),
          const SectionTitle(title: 'MOST POPULAR'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isPopular)
                      .toList(),
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}
