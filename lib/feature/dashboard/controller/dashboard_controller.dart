import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/home/screens/home_screen.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/custom_left_appbar.dart';
import 'package:ueh_project_admin/feature/employ/screens/employ_main_screen.dart';
import 'package:ueh_project_admin/feature/mail_notification/screens/mail_notification_screen.dart';
import 'package:ueh_project_admin/feature/messenger/screens/main_messenger_screen.dart';
import 'package:ueh_project_admin/feature/profile/screns/profile_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/task_screen.dart';

class DashboardController extends GetxController {
  var isOpened = false.obs;

  var pageIndex = 0.obs;
  final scaffoldDashboardScreenKey = GlobalKey<ScaffoldState>();

  void selectPage(int value) {
    pageIndex.value = value;
    update([Utils.idLeftNavigatorBar]);
  }

  void openAppBar(GlobalKey<ScaffoldState> key) {
    // isOpened.value = !isOpened.value;
    key.currentState!.openDrawer();
  }

  late final leftAppBarWidget = CustomLeftAppBar(
    isOpened: isOpened.value,
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
        HomeScreen(),
        EmployMainScreen(),
        TaskScreen(),
        ProfileScreen(),
        MailNotificationScreen(),
        MainMessengerScreen(),
      ],
    ),
  );
}
