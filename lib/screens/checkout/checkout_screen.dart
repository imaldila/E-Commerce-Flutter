import 'package:e_commerce_bloc/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CheckoutLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: kTextStyle18Bold,
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: value));
                    }, context, 'Email'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, context, 'Name'),
                    Text(
                      'DELIVERY INFORMATION',
                      style: kTextStyle18Bold,
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    }, context, 'Address'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    }, context, 'City'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    }, context, 'Country'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: value));
                    }, context, 'Zip Code'),
                    const SizedBox(
                      height: kSizeBox,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kColorCard,
                        borderRadius: BorderRadius.circular(kBorder),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/payment-selection');
                            },
                            child: Text(
                              'Select Payment Method',
                              style:
                                  kTextStyle18Bold.copyWith(color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kSizeBox,
                    ),
                    Text(
                      'ORDER SUMMARY',
                      style: kTextStyle18Bold,
                    ),
                    const OrderSummary()
                  ],
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(kPadding / 2),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: kTextStyle14Black,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                // isDense: true,
                contentPadding: EdgeInsets.only(left: kPadding / 1.2),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
