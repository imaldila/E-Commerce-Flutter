import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_bloc/constant.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
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
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
                // enableInfiniteScroll: false,
                // autoPlay: true,
              ),
              items: Category.categories
                  .map((category) => CardHeroCarousel(category: category))
                  .toList(),
            ),
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          const SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isPopular)
                .toList(),
          ),
        ],
      ),
    );
  }
}
