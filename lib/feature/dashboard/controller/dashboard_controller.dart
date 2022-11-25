import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/custom_left_appbar.dart';
import 'package:ueh_project_admin/feature/employ/screens/employ_main_screen.dart';
import 'package:ueh_project_admin/feature/mail_notification/screens/mail_notification_screen.dart';
import 'package:ueh_project_admin/feature/messenger/screens/main_messenger_screen.dart';
import 'package:ueh_project_admin/feature/profile/screns/profile_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/create_project_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/task_screen.dart';
import 'package:ueh_project_admin/feature/time_line/screens/time_line_board_column_screen.dart';

import '../../time_line/screens/time_line_main_screen.dart';

class DashboardController extends GetxController {
  var pageIndex = 0.obs;
  final scaffoldDashboardScreenKey = GlobalKey<ScaffoldState>();

  void selectPage(int value) {
    pageIndex.value = value;
    update([Utils.idLeftNavigatorBar]);
  }

  void openAppBar(GlobalKey<ScaffoldState> key) {
    if (key.currentState!.isDrawerOpen || key.currentState!.isEndDrawerOpen) {
      key.currentState!.closeDrawer();
      key.currentState!.closeEndDrawer();
    } else {
      key.currentState!.openDrawer();
    }
  }

  late final leftAppBarWidget = CustomLeftAppBar(
    isOpened: true,
    widthDevice: Get.width,
    selectPage: selectPage,
    scaffoldDashboardScreenKey: scaffoldDashboardScreenKey,
  );

  late final leftAppBarWidgetDashboard = CustomLeftAppBar(
    isOpened: false,
    widthDevice: Get.width,
    selectPage: selectPage,
    scaffoldDashboardScreenKey: scaffoldDashboardScreenKey,
  );

  late final pages = Obx(
    () => IndexedStack(
      alignment: Alignment.topLeft,
      sizing: StackFit.loose,
      index: pageIndex.value,
      children: [
        TimeLineColumnScreen(),
        CreateProjectScreen(),
        EmployMainScreen(),
        TaskScreen(),
        MailNotificationScreen(),
        ProfileScreen(),
      ],
      children: Utils.widgetDashboard,
    ),
  );
}
