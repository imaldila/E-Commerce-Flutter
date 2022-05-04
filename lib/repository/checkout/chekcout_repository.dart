import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/models/category_model.dart';
import 'package:e_commerce_bloc/models/checkout_model.dart';

import 'package:e_commerce_bloc/repository/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({required FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
