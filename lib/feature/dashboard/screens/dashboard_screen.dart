import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/constants/reponsiveness.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/custom_drawer.dart';
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
  double turns = 0.0;
  double widthDevice = Get.width;

  final scaffoldDashboardScreenKey = GlobalKey<ScaffoldState>();

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Scaffold(
      endDrawer: CustomDrawer(),
      key: scaffoldDashboardScreenKey,
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: Padding(
        padding: (isSmallScreen)
            ? const EdgeInsets.only(top: 20)
            : const EdgeInsets.only(top: 0),
        child: Row(
          children: [
            if (!isSmallScreen)
              Obx(() {
                return CustomLeftAppBar(
                  isOpened: dashboardController.isOpened.value,
                  openAppBar: dashboardController.openAppBar,
                  widthDevice: widthDevice,
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
                          CustomAppBarDashboard(
                              scaffoldDashboardScreenKey:
                                  scaffoldDashboardScreenKey),
                          if (!isSmallScreen) ...[
                            const SizedBox(height: 35),
                            const CustomToolBar()
                          ],
                          TaskScreen(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
