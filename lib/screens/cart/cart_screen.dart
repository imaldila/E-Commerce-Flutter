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
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  'GO TO CHECKOUT',
                  style: kTextStyle18Bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kHorPad, vertical: kVerPad),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                              borderRadius: BorderRadius.circular(kBorder))),
                      onPressed: () {},
                      child: Text(
                        'Add More Item',
                        style: kTextStyle12Black,
                      ),
                    ),
                  ],
                ),
                CartProductCard(product: Product.products[0]),
                CartProductCard(product: Product.products[1]),
                CartProductCard(product: Product.products[2]),
              ],
            ),
            Column(
              children: [
                const Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kHorPad * 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SUBTOTAL',
                            style: kTextStyle14BoldBlack,
                          ),
                          Text(
                            '\$5.98',
                            style: kTextStyle14BoldBlack,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kSizeBox,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DELIVERY FEE',
                            style: kTextStyle14BoldBlack,
                          ),
                          Text(
                            '\$2.55',
                            style: kTextStyle14BoldBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kSizeBox,
                ),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kHorPad * 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUBTOTAL',
                              style: kTextStyle14BoldBlack.copyWith(
                                  color: Colors.white),
                            ),
                            Text(
                              '\$5.98',
                              style: kTextStyle14BoldBlack.copyWith(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
