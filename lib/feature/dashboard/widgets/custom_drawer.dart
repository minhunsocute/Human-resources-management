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
      width: Get.width * 0.32,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      elevation: 10,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              'UEH MUON NAM',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AppBarItem(
              isOpened: dashboardController.isOpened.value,
              title: 'Dashboard',
              icon: Icons.dashboard_outlined,
              index: 0,
            ),
          )
        ],
      ),
    );
  }
}
