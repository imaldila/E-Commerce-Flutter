import 'package:flutter/material.dart';

import '../components.dart';
import '../models/models.dart';


class CardHeroCarousel extends StatelessWidget {
  const CardHeroCarousel({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kVerPad,
        horizontal: kHorPad / 2,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              category.imageURL,
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
                  category.name,
                  style: kTextStyle20White
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

