part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName,
      email,
      address,
      city,
      country,
      zipCode,
      subTotal,
      deliveryFee,
      total;
  final List<Product>? products;

  final Checkout checkout;

  CheckoutLoaded({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.subTotal,
    this.deliveryFee,
    this.total,
    this.products,
  }) : checkout = Checkout(
          fullName: fullName,
          email: email,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
          subTotal: subTotal,
          deliveryFee: deliveryFee,
          total: total,
          products: products!,
        );

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        subTotal,
        deliveryFee,
        total,
        products,
      ];
}
