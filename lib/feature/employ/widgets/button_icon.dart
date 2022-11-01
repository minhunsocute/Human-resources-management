import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final String title;
  final Function() press;
  final IconData icon;
  final Color color1;
  final Color color2;
  const ButtonIcon({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: color2,
        ),
        child: Row(
          children: [
            Text(
              '$title ',
              style: TextStyle(
                  color: color1, fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            Icon(icon, color: color1),
          ],
        ),
      ),
    );
  }
}
