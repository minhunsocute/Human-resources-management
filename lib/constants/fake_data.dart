import 'package:flutter/material.dart';

class FakeData {
  List<Map<String, dynamic>> listCategory = [
    {
      'icon': Icons.home,
      'title': 'Home',
      'color1': Colors.blue,
      'color2': Colors.blue.withOpacity(0.3),
    },
    {
      'icon': Icons.work,
      'title': 'Work',
      'color1': Colors.red,
      'color2': Colors.red.withOpacity(0.3),
    },
    {
      'icon': Icons.design_services,
      'title': 'Design',
      'color1': Colors.orange,
      'color2': Colors.orange.withOpacity(0.3),
    },
    {
      'icon': Icons.computer,
      'title': 'Coding',
      'color1': Colors.green,
      'color2': Colors.green.withOpacity(0.3),
    },
    {
      'icon': Icons.book,
      'title': 'Course',
      'color1': Colors.purple,
      'color2': Colors.purple.withOpacity(0.3),
    },
  ];

  List<Color> listColor = [
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.white,
    Colors.pink
  ];
}
