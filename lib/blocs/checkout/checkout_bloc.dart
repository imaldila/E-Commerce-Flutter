import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/blocs/blocs.dart';
import 'package:e_commerce_bloc/models/models.dart';
import 'package:e_commerce_bloc/repository/checkout/chekcout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;
  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoaded).cart.products,
                  subTotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                  deliveryFee:
                      (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                  total: (cartBloc.state as CartLoaded).cart.totalString,
                )
              : CheckoutLoading(),
        ) {
    _cartSubscription = cartBloc.stream.listen(
      (state) {
        if (state is CartLoaded) {
          add(
            UpdateCheckout(cart: state.cart),
          );
        }
      },
    );

    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subTotal: event.cart?.subtotalString ?? state.subTotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
        ),
      );
    }
  }

  void _onConfirmCheckout(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    _checkoutSubscription?.cancel();

    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }
}
