
import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/models.dart';
import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: kVerPad / 3,
            horizontal: kHorPad,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: kPadding / 3),
              child: ProductCard(
                product: products[index],
              ),
            );
          }),
    );
  }
}
