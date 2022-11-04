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
  final scaffoldDashboardScreenKey = GlobalKey<ScaffoldState>();
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Scaffold(
      endDrawer:
          CustomDrawer(leftAppBarWidget: dashboardController.leftAppBarWidget),
      key: scaffoldDashboardScreenKey,
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: Padding(
        padding: (isSmallScreen)
            ? const EdgeInsets.only(top: 20)
            : const EdgeInsets.only(top: 0),
        child: Row(
          children: [
            if (!isSmallScreen) dashboardController.leftAppBarWidget,
            Flexible(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: CustomAppBarDashboard(
                              scaffoldDashboardScreenKey:
                                  scaffoldDashboardScreenKey),
                        ),
                        if (!isSmallScreen) ...[
                          const SizedBox(height: 35),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: CustomToolBar(),
                          )
                        ],
                        dashboardController.pages,
                      ],
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
