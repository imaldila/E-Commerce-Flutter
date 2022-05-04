import 'package:e_commerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName,
      email,
      address,
      city,
      country,
      zipCode,
      subTotal,
      deliveryFee,
      total;
  final List<Product?> products;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.subTotal,
    required this.deliveryFee,
    required this.total,
    required this.products,
  });

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

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipcode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products.map((product) => product!.name).toList(),
      'subtotal': subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }
}
