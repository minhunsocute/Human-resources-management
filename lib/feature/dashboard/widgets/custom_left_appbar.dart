import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  Offset offset = Offset(-1, 0);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      curve: Curves.linear,
      duration: Utils.animationDuration,
      width: widget.isOpened
          ? widget.widthDevice * 0.12
          : widget.widthDevice * 0.04,
      child: GetBuilder<DashboardController>(
          assignId: true,
          id: Utils.idLeftNavigatorBar,
          builder: (controller) {
            return NavigationRail(
              leading: Padding(
                padding: const EdgeInsets.only(top: 20),
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
                    if (widget.isOpened)
                      RichText(text: Utils.starAdminTextSpan),
                  ],
                ),
              ),
              backgroundColor: widget.isOpened
                  ? AppColors.greyBackgroundCOlor
                  : Colors.white,
              extended: widget.isOpened,
              onDestinationSelected: controller.selectPage,
              selectedIndex: controller.pageIndex.value,
              destinations: Utils.titleAndIconList
                  .map(
                    (e) => NavigationRailDestination(
                      icon: e['icon'] as Icon,
                      label: Text(e['title'] as String),
                    ),
                  )
                  .toList(),
            );
          }),
    );
  }
}
