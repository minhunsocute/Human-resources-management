import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  TextEditingController test = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: test,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search_outlined,
          color: Colors.grey,
          size: 20,
        ),
        border: InputBorder.none,
        hintText: "Search in Messages",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
