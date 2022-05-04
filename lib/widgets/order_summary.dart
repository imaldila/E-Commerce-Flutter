import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../constant.dart';
import '../models/models.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CartLoaded) {
          return Column(
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
                          '\$ ${state.cart.subtotalString}',
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
                          '\$ ${state.cart.deliveryFeeString}',
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
                      borderRadius: BorderRadius.circular(kBorder / 2),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: kColorCard,
                      borderRadius: BorderRadius.circular(kBorder / 2),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kHorPad * 3.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: kTextStyle14BoldBlack.copyWith(
                                color: Colors.white),
                          ),
                          Text(
                            '\$ ${state.cart.totalString}',
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
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
