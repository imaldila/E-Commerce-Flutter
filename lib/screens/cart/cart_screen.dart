import 'package:e_commerce_bloc/constant.dart';
import 'package:e_commerce_bloc/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kHorPad, vertical: kVerPad),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add \$20.0 for FREE Delivery',
                  style: kTextStyle14BoldBlack,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {},
                  child: Text(
                    'Add More Item',
                    style: kTextStyle12Black,
                  ),
                ),
              ],
            ),
            CartProductCard(
              product: Product.products[0],
            )
          ],
        ),
      ),
    );
  }
}
