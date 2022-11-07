import 'package:flutter/material.dart';

class MessageToolbar extends StatelessWidget {
  const MessageToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.phone_outlined,
          color: Colors.grey,
          size: 20,
        ),
        SizedBox(width: 20),
        Icon(
          Icons.videocam,
          color: Colors.grey,
          size: 20,
        ),
        Spacer(),
        Icon(
          Icons.circle,
          color: Colors.green,
          size: 12,
        ),
        SizedBox(width: 5),
        Text(
          "Hoang Ankin",
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(
          Icons.open_in_full_outlined,
          color: Colors.grey,
          size: 20,
        ),
        SizedBox(width: 20),
        Icon(
          Icons.more_vert_outlined,
          color: Colors.grey,
          size: 20,
        ),
      ],
    );
  }
}
