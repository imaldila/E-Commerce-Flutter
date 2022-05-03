import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_mapStarWishlistToState);
  }

  void _mapStarWishlistToState(
      StartWishlist event, Emitter<WishlistState> emit) {}
}
