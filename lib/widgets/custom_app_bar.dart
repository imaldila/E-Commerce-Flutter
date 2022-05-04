import 'package:flutter/material.dart';

import '../constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title, this.automaticlyImplyLeading = true,
  }) : super(key: key);

  final String title;
  final bool automaticlyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding / 2),
      child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: automaticlyImplyLeading,
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
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
