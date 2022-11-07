import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'app_color.dart';

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

final List<Map<String, dynamic>> listPopupButtonField2 = [
  {
    'message': 'Mail Recieve',
    'child': Row(
      children: const [
        Icon(Icons.mail, color: AppColors.textColor, size: 20.0),
        Text(
          ' Mail Recievei',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
  {
    'message': 'Mail Send',
    'child': Row(
      children: const [
        Icon(FontAwesome.send, color: AppColors.textColor, size: 20.0),
        Text(
          ' Mail  Send',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
  {
    'message': 'Draft Mail',
    'child': Row(
      children: const [
        Icon(Icons.drafts_rounded, color: AppColors.textColor, size: 20.0),
        Text(
          ' Draft mail',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
];
final List<Map<String, dynamic>> listPopupButtonField3 = [
  {
    'message': 'Read/Unread Mail',
    'child': Row(
      children: const [
        Icon(Icons.email, color: AppColors.textColor, size: 20.0),
        Text(
          ' Read/UnRead',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
];
final List<Map<String, dynamic>> listPopupButton = [
  {
    'message': 'Change LeftBar',
    'child': const Icon(Icons.menu, color: AppColors.textColor),
    'color': Colors.white,
  },
  {
    'message': 'New Mail',
    'child': Row(
      children: const [
        Icon(Icons.mail, color: Colors.white),
        Text(
          ' New Mail',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
      ],
    ),
    'color': const Color.fromARGB(255, 22, 114, 190),
  },
  {
    'message': 'Delete Mail',
    'child': Row(
      children: const [
        Icon(Icons.delete, color: AppColors.textColor),
        Text(
          ' Delete',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
  {
    'message': 'Storage Mail',
    'child': Row(
      children: const [
        Icon(Icons.storage_outlined, color: AppColors.textColor),
        Text(
          ' Storage',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
  {
    'message': 'Report Mail',
    'child': Row(
      children: const [
        Icon(Icons.security, color: AppColors.textColor),
        Text(
          ' Report',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
  {
    'message': 'Clear Mail',
    'child': Row(
      children: const [
        Icon(Icons.cleaning_services_rounded, color: AppColors.textColor),
        Text(
          ' Clear',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    ),
    'color': Colors.white,
  },
];
