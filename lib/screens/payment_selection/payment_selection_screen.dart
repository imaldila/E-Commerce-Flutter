import 'package:e_commerce_bloc/constant.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../widgets/widgets.dart';

class PaymentSelection extends StatelessWidget {
  const PaymentSelection({Key? key}) : super(key: key);

  static const String routeName = '/payment-selection';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PaymentSelection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Selection'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // RawApplePayButton(
          //   style: ApplePayButtonStyle.black,
          //   type: ApplePayButtonType.inStore,
          //   onPressed: () {
          //     print('Apple Pay Selected');
          //   },
          // ),
        ],
      ),
    );
  }
}
