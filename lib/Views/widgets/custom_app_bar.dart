import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.icon, required this.title, this.onpressed});
  final IconData icon;
  final String title;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          CustomIcon(
            icon: icon,
            onprssed: onpressed,
          )
        ],
      ),
    );
  }
}
