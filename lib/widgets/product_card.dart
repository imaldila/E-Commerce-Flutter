import 'package:flutter/material.dart';

import '../components.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ),
        Positioned(
          top: 65,
          left: 5,
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kPadding / 2),
              child: Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name, style: kTextStyle12White),
                        Text('\$${product.price}', style: kTextStyle12White),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
