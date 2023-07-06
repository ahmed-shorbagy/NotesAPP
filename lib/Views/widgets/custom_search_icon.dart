import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onprssed});
  final IconData icon;
  final void Function()? onprssed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16)),
      child: IconButton(
          onPressed: onprssed,
          icon: Icon(
            icon,
            size: 30,
          )),
    );
  }
}
