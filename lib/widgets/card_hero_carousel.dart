import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/models.dart';

class CardHeroCarousel extends StatelessWidget {
  const CardHeroCarousel({Key? key, this.category, this.product})
      : super(key: key);
  final Category? category;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.pushNamed(
            context,
            '/catalog',
            arguments: category,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: kVerPad,
          horizontal: kHorPad / 2,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                product == null ? category!.imageUrl : product!.imageUrl,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: kVerPad,
                    horizontal: kHorPad,
                  ),
                  child: Text(
                    product == null ? category!.name : '',
                    style: kTextStyle20White,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
