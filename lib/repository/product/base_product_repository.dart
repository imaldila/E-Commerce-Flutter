import 'package:e_commerce_bloc/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
}
