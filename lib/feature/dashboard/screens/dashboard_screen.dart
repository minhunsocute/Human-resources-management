import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/feature/employ/screens/employ_main_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/create_project_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/task_screen.dart';

import '../widgets/custom_appbar_dashboard.dart';
import '../widgets/custom_left_appbar.dart';
import '../widgets/custom_tool_bar.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Rx<double> widthDrawer = (Get.width * 0.2).obs;
  var isOpened = false.obs;
  double turns = 0.0;
  double widthDevice = Get.width;
  RxInt pagees = 0.obs;

  void openAppBar() {
    isOpened.value = !isOpened.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: Row(
        children: [
          Obx(() {
            return CustomLeftAppBar(
              widthDevice: widthDevice,
              isOpened: isOpened.value,
              openAppBar: openAppBar,
            );
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, right: 15.0),
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height),
                      child: IntrinsicHeight(
                          child: Column(
                        children: [
                          const CustomAppBarDashboard(),
                          const SizedBox(height: 35),
                          const CustomToolBar(),
                          CreateProjectScreen(),
                        ],
                      )))),

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [

              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
