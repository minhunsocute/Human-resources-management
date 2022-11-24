import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/custom_left_appbar.dart';

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
      children: Utils.widgetDashboard,
    ),
  );
}
