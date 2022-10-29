import 'package:flutter/material.dart';

class Utils {
  static const BorderRadius appBarItemBorder =
      BorderRadius.horizontal(right: Radius.circular(20));

  static const EdgeInsets appBarItemPadding = EdgeInsets.symmetric(vertical: 8);
  static const BoxDecoration blueVerticalLineTabBarItem = BoxDecoration(
    border: Border(
      left: BorderSide(color: Colors.blue, width: 2),
    ),
  );

  static const SizedBox emptySizeBox = SizedBox();

  static const Duration animationDuration = Duration(milliseconds: 150);

  static const dashboardIcon = Icon(Icons.dashboard_outlined, size: 28);

  static const employeesIcon = Icon(Icons.people_outline_outlined, size: 28);

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

  static const textStyleTabBarItem = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const EdgeInsets edgeInsetsHor10Ver5 =
      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
}
