import 'dart:async';

import 'package:e_commerce_bloc/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: 125,
              height: 125,
            ),
          ),
          const SizedBox(
            height: kSizeBox * 4,
          ),
          Text(
            'Zero To Unicorn',
            style: kTextStyle24BoldBlack,
          )
        ],
      ),
    );
  }
}
