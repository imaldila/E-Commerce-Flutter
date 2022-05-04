import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:e_commerce_bloc/repository/product/product_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<UpdateProduct>(_onUpdateProduct);
  }

  void _onLoadProduct(LoadProduct event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProduct().listen(
          (products) => add(
            UpdateProduct(products),
          ),
        );
  }

  void _onUpdateProduct(UpdateProduct event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
