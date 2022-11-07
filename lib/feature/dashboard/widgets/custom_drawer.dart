import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/reponsiveness.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.leftAppBarWidget});
  final Widget leftAppBarWidget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: ResponsiveWidget.isSmallScreen(context)
          ? Get.width * 0.35
          : Get.width * 0.15,
      elevation: 10,
      child: leftAppBarWidget,
    );
  }
}
