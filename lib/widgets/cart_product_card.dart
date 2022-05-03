import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../constant.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(onPressed: () {
                    context.read<CartBloc>().add(RemoveProduct(product));
                  }, icon: const Icon(Icons.remove)),
                  Text('$quantity', style: kTextStyle12Black,),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddProduct(product));
                      }, icon: const Icon(Icons.add_circle)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
