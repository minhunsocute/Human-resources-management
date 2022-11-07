import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomToolBar extends StatelessWidget {
  const BottomToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.people,
            color: Colors.grey,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.message_outlined, color: Colors.grey),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.phone, color: Colors.grey),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.settings, color: Colors.grey),
        ),
      ],
    );
  }
}
