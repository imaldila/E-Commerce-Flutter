import 'package:e_commerce_bloc/constant.dart';
import 'package:e_commerce_bloc/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(
        category: category,
      ),
    );
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: kPadding,
          horizontal: kPadding / 2,
        ),
        itemCount: categoryProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
