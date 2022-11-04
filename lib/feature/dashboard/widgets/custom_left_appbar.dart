import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';

import '../../../constants/app_color.dart';

class CustomLeftAppBar extends StatefulWidget {
  const CustomLeftAppBar(
      {super.key,
      required this.isOpened,
      required this.openAppBar,
      required this.widthDevice,
      required this.selectPage});
  final bool isOpened;
  final double widthDevice;
  final Function() openAppBar;
  final Function(int) selectPage;
  @override
  State<CustomLeftAppBar> createState() => _CustomLeftAppBarState();
}

class _CustomLeftAppBarState extends State<CustomLeftAppBar> {
  double turns = 0;

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => NavigationRail(
          leading: Padding(
            padding: Utils.appBarItemPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.openAppBar();
                    turns = turns + (widget.isOpened ? -1 : 1);
                  },
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 350),
                    turns: turns,
                    child: Icon(
                      Icons.menu_outlined,
                      color: Colors.black.withOpacity(0.45),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                AnimatedDefaultTextStyle(
                  duration: Utils.animationDuration,
                  style: TextStyle(fontSize: widget.isOpened ? 23 : -2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: Utils.starAdminText,
                  ),
                )
              ],
            ),
          ),
          minExtendedWidth: widget.widthDevice * 0.13,
          labelType: NavigationRailLabelType.none,
          backgroundColor:
              widget.isOpened ? AppColors.greyBackgroundCOlor : Colors.white,
          extended: widget.isOpened,
          onDestinationSelected: controller.selectPage,
          selectedIndex: controller.pageIndex.value,
          destinations: Utils.titleAndIconList
              .map(
                (e) => NavigationRailDestination(
                  icon: e['icon'] as Icon,
                  label: AnimatedDefaultTextStyle(
                    duration: Utils.animationDuration,
                    style: TextStyle(fontSize: widget.isOpened ? 15 : -2),
                    child: Text(e['title'] as String),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
