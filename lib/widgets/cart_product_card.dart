import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorder),
              child: Image.network(
                product.imageUrl,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: kSizeBox,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: kTextStyle12Black,
                ),
                Text('\$ ${product.price}')
              ],
            ),
          ),
          const SizedBox(
            width: kSizeBox,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
              const Text('1'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
            ],
          ),
         
        ],
      ),
    );
  }
}
