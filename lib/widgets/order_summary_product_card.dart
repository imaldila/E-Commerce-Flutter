import 'package:e_commerce_bloc/models/models.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding / 2),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: kSizeBox / 2,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: kTextStyle12Black,
                ),
                Text(
                  'Qty. $quantity',
                  style: kTextStyle12Black.copyWith(
                      fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '\$ ${product.price}',
              style: kTextStyle14BoldBlack,
            ),
          )
        ],
      ),
    );
  }
}
