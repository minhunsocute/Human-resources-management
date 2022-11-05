import 'package:flutter/material.dart';

class ButtonContact extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final Function() press;
  const ButtonContact({
    Key? key,
    required this.image,
    required this.title,
    required this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: color,
        ),
        child: Row(
          children: [
            Image.asset(image, width: 20.0, height: 32.0),
            const SizedBox(width: 5.0),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
