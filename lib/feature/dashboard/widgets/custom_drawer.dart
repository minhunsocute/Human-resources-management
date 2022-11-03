import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/appbar_item.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    dashboardController.isOpened.value = true;
    return Drawer(
      width: Get.width * 0.35,
      elevation: 10,
      child: dashboardController.leftAppBarWidget,
    );
  }
}
