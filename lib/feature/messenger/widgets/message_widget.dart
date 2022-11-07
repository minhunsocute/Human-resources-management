import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 15,
          color: Colors.blueGrey[300],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
