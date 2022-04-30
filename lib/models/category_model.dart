import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name, imageURL;

  const Category({required this.name, required this.imageURL});

  @override
  List<Object?> get props => [name, imageURL];

  static List<Category> categories = [
    Category(
      name: 'Soft Drink',
      imageURL:
          'https://images.unsplash.com/photo-1534057308991-b9b3a578f1b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/5lZhD2qQ2SE,
    ),
    Category(
      name: 'Smoothies',
      imageURL:
          'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/m741tj4Cz7M,
    ),
    Category(
      name: 'Water',
      imageURL:
          'https://images.unsplash.com/photo-1559839914-17aae19cec71?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/7Zlds3gm7NU,
    ),
  ];
}
