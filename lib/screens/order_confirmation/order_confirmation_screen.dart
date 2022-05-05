import 'package:e_commerce_bloc/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  static const String routeName = '/order-confirmation';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderConfirmation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Order Confirmation',
          automaticlyImplyLeading: false,
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: const CustomNavBar(
          screen: routeName,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.amberAccent,
                    width: double.infinity,
                    height: 300,
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width - 100) / 2,
                    top: 125,
                    child: SvgPicture.asset('assets/svgs/garlands.svg'),
                  ),
                  Positioned(
                    top: 250,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Your Order is Complete !',
                      textAlign: TextAlign.center,
                      style: kTextStyle24BoldBlack.copyWith(
                          color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER# 1234 - 1234',
                      style: kTextStyle14BoldBlack,
                    ),
                    const SizedBox(
                      height: kSizeBox,
                    ),
                    Text(
                      'Thank You for Purchashing in Zero To Unicorn',
                      style: kTextStyle14Black,
                    ),
                    const SizedBox(
                      height: kSizeBox,
                    ),
                    Text(
                      'ORDER# 1234 - 1234',
                      style: kTextStyle14BoldBlack,
                    ),
                    const SizedBox(
                      height: kSizeBox,
                    ),
                    const OrderSummary(),
                    const SizedBox(
                      height: kSizeBox,
                    ),
                    Text(
                      'ORDER DETAILS',
                      style: kTextStyle14BoldBlack,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: kSizeBox / 2,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        OrderSummaryProductCard(
                          product: Product.products[0],
                          quantity: 2,
                        ),
                        OrderSummaryProductCard(
                          product: Product.products[1],
                          quantity: 2,
                        ),
                        OrderSummaryProductCard(
                          product: Product.products[2],
                          quantity: 2,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
