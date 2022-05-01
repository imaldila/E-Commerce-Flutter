import 'package:flutter/material.dart';

import '../constant.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorPad),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: kTextStyle18Bold,
        ),
      ),
    );
  }
}
