import 'package:flutter/material.dart';

import '../constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          title,
          style: kTextStyle24BoldBlack,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/whislist');
            },
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
