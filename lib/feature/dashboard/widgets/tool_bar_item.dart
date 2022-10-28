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

class ToolBarButtonItem extends StatelessWidget {
  const ToolBarButtonItem({super.key, required this.title, required this.icon});
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.blueAccent,
          width: 0.2,
        ),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
