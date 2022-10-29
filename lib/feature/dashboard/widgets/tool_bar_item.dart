import 'package:flutter/material.dart';

class ToolBarTextItem extends StatelessWidget {
  const ToolBarTextItem(
      {super.key,
      required this.text,
      required this.decoration,
      required this.onTap,
      required this.color});
  final String text;
  final BoxDecoration? decoration;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      ),
    );
  }
}
