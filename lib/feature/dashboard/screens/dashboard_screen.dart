import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/constants/reponsiveness.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/custom_drawer.dart';

import '../widgets/custom_appbar_dashboard.dart';
import '../widgets/custom_tool_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double turns = 0.0;
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Scaffold(
      key: dashboardController.scaffoldDashboardScreenKey,
      drawer:
          CustomDrawer(leftAppBarWidget: dashboardController.leftAppBarWidget),
      endDrawer:
          CustomDrawer(leftAppBarWidget: dashboardController.leftAppBarWidget),
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: Padding(
        padding: (isSmallScreen)
            ? const EdgeInsets.only(top: 20)
            : const EdgeInsets.only(top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isSmallScreen) dashboardController.leftAppBarWidgetDashboard,
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBarDashboard(
                        scaffoldDashboardScreenKey:
                            dashboardController.scaffoldDashboardScreenKey),
                    if (!isSmallScreen) ...[
                      const SizedBox(height: 35),
                      const CustomToolBar()
                    ],
                    Expanded(child: dashboardController.pages),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
