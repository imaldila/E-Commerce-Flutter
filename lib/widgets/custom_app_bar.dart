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
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kVerPad,
          horizontal: kHorPad,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            kPadding,
          ),
        ),
        child: Text(
          title,
          style: kTextStyle24BoldWhite,
        ),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
