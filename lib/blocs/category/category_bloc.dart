import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/repository/category/category_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategory>(_onLoadCategory);
    on<UpdateCategory>(_onUpdateCategory);
  }

  void _onLoadCategory(LoadCategory event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategory(categories),
          ),
        );
  }

  void _onUpdateCategory(UpdateCategory event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
