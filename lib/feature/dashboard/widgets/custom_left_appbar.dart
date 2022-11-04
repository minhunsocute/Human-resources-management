import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';

class CustomLeftAppBar extends StatelessWidget {
  const CustomLeftAppBar(
      {super.key,
      required this.isOpened,
      required this.widthDevice,
      required this.selectPage});
  final bool isOpened;
  final double widthDevice;
  final Function(int) selectPage;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        assignId: true,
        id: Utils.idLeftNavigatorBar,
        builder: (controller) {
          return NavigationRail(
            leading: LeftAppBarLeading(
              isOpened: isOpened,
              openAppBar: controller.openAppBar,
            ),
            minExtendedWidth: widthDevice * 0.13,
            labelType: NavigationRailLabelType.none,
            backgroundColor:
                isOpened ? AppColors.greyBackgroundCOlor : Colors.white,
            extended: isOpened,
            onDestinationSelected: controller.selectPage,
            selectedIndex: controller.pageIndex.value,
            destinations: Utils.titleAndIconWidget,
          );
        });
  }
}

// ignore: must_be_immutable
class LeftAppBarLeading extends StatelessWidget {
  const LeftAppBarLeading({
    super.key,
    required this.isOpened,
    required this.openAppBar,
  });

  final bool isOpened;
  final Function() openAppBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.appBarItemPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: openAppBar,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 350),
              turns: isOpened ? 1 : -1,
              curve: Utils.curvesAnimation,
              child: const Icon(
                Icons.menu_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 10),
          AnimatedDefaultTextStyle(
            duration: Utils.animationDuration,
            style: TextStyle(fontSize: isOpened ? 23 : -2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: Utils.starAdminText,
            ),
          )
        ],
      ),
    );
  }
}
