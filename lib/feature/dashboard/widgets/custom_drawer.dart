import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.leftAppBarWidget});
  final Widget leftAppBarWidget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.35,
      elevation: 10,
      child: leftAppBarWidget,
    );
  }
}
