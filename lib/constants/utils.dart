import 'package:flutter/material.dart';
import 'package:ueh_project_admin/feature/contest/screens/contest_management_screen.dart';

import '../feature/employee/screens/employ_main_screen.dart';
import '../feature/home/screens/home_screen.dart';
import '../feature/mail_notification/screens/mail_notification_screen.dart';
import '../feature/messenger/screens/main_messenger_screen.dart';
import '../feature/profile/screns/profile_screen.dart';
import '../feature/task_project/screens/task_screen.dart';
import 'app_color.dart';

class Utils {
  static const double iconSize = 28;
  static const List<Map<String, dynamic>> titleAndIconList = [
    {
      'title': 'Dashboard',
      'icon': Icons.dashboard_outlined,
      'position': 60,
    },
    {
      'title': 'Employee',
      'icon': Icons.people_outline_outlined,
      'position': 130,
    },
    {
      'title': 'Exam',
      'icon': Icons.book_outlined,
      'position': 203,
    },
    {
      'title': 'Project',
      'icon': Icons.assignment_outlined,
      'position': 273,
    },
    {
      'title': 'Profile',
      'icon': Icons.person_outline,
      'position': 343,
    },
    {
      'title': 'Mail',
      'icon': Icons.mail_outline,
      'position': 413,
    },
    {
      'title': 'Message',
      'icon': Icons.message_outlined,
      'position': 483,
    }
  ];

  static const BorderRadius appBarItemBorder =
      BorderRadius.horizontal(right: Radius.circular(20));

  static final Image faceImage = Image.asset(
    'images/face8.jpg',
    fit: BoxFit.cover,
  );

  static const curvesAnimation = Curves.easeInOut;

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

  static final List<Widget> widgetDashboard = [
    HomeScreen(),
    EmployMainScreen(),
    ContestManagementScreen(),
    TaskScreen(),
    ProfileScreen(),
    MailNotificationScreen(),
    MainMessengerScreen(),
  ];

  static const List<Widget> tableTitleListEmployee = [
    Expanded(
      flex: 1,
      child: Text('CANDIDATE NAME',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold)),
    ),
    Expanded(
      flex: 1,
      child: Text('EMAIL ADDRESS',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold)),
    ),
    Expanded(
      flex: 1,
      child: Text('CONTACT NUMBER',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold)),
    ),
    Expanded(
      flex: 1,
      child: Text('JOB TITLE',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold)),
    ),
    Expanded(
      flex: 1,
      child: Text('STATUS',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold)),
    ),
  ];

  static const emptyTextSpan = TextSpan();

  static const EdgeInsets edgeInsetsHor10Ver5 =
      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
}
