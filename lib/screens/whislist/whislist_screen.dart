import 'package:e_commerce_bloc/models/models.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../widgets/widgets.dart';

class WhislistScreen extends StatelessWidget {
  const WhislistScreen({Key? key}) : super(key: key);

  static const String routeName = '/whislist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WhislistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Whislist',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: kPadding,
          horizontal: kPadding / 2,
        ),
        itemCount: Product.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.4,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: ProductCard(
              product: Product.products[index],
              widthFactor: 1.1,
              leftPosition: 100,
              isWishList: true,
            ),
          );
        },
      ),
    );
  }
}
