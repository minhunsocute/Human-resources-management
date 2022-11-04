import 'package:flutter/material.dart';

class Utils {
  static const double iconSize = 28;
  static const List<Map<String, dynamic>> titleAndIconList = [
    {
      'index': 0,
      'title': 'Dashboard',
      'icon': Icon(Icons.dashboard_outlined, size: iconSize),
    },
    {
      'index': 1,
      'title': 'Employee',
      'icon': Icon(Icons.people_outline_outlined, size: iconSize),
    },
    {
      'index': 2,
      'title': 'Project',
      'icon': Icon(Icons.assignment_outlined, size: iconSize),
    },
    {
      'index': 3,
      'title': 'Profile',
      'icon': Icon(Icons.person_outline, size: iconSize),
    }
  ];

  static const BorderRadius appBarItemBorder =
      BorderRadius.horizontal(right: Radius.circular(20));

  static final Image faceImage = Image.asset(
    'images/face8.jpg',
    fit: BoxFit.cover,
  );

  static const starAdminText = [
    Text('Star'),
    Text(
      'Admin',
      style: TextStyle(color: Colors.blue),
    )
  ];

  static const idLeftNavigatorBar = 'leftNavigatorBar';

  static const EdgeInsets appBarItemPadding = EdgeInsets.symmetric(vertical: 8);
  static const BoxDecoration blueVerticalLineTabBarItem = BoxDecoration(
    border: Border(
      left: BorderSide(color: Colors.blue, width: 2),
    ),
  );

  static const SizedBox emptySizeBox = SizedBox();

  static const Duration animationDuration = Duration(milliseconds: 150);

  static const spaceBetweenTabBarItem = SizedBox(height: 2.5);

  static const EdgeInsets edgeInsetsHorizontal20 =
      EdgeInsets.symmetric(horizontal: 20.0);

  static const EdgeInsets edgeInsetsAll20 = EdgeInsets.all(20.0);

  static const EdgeInsets edgeInsetsRight20Left20 =
      EdgeInsets.only(right: 20.0, left: 10.0);

  static const List<String> listDaysInWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  static const starAdminTextSpan = TextSpan(
    text: 'Star',
    style: TextStyle(
      fontSize: 23,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    children: [
      TextSpan(
        text: 'Admin',
        style: TextStyle(color: Colors.blueAccent),
      )
    ],
  );

  static const emptyTextSpan = TextSpan();

  static const EdgeInsets edgeInsetsHor10Ver5 =
      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
}
