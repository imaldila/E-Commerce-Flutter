import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WhislistScreen extends StatelessWidget {
  const WhislistScreen({Key? key}) : super(key: key);

  static const String routeName = '/whislist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WhislistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Whislist',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
