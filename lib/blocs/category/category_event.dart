part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategory extends CategoryEvent {}

class UpdateCategory extends CategoryEvent {
  final List<Category> categories;

  const UpdateCategory(this.categories);
  
  @override
  List<Object> get props => [categories];
}
