import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_onStarWishlist);
    on<AddWishlistProduct>(_addProductToWishlist);
    on<RemoveWishlistProduct>(_removeProductToWishlist);
  }

  void _onStarWishlist(StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _addProductToWishlist(
      AddWishlistProduct event, Emitter<WishlistState> emit) {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishList: WishList(
              products: List.from((state as WishlistLoaded).wishList.products)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _removeProductToWishlist(
      RemoveWishlistProduct event, Emitter<WishlistState> emit) {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishList: WishList(
              products: List.from((state as WishlistLoaded).wishList.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
