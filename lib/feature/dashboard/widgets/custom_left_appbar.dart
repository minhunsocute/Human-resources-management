import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';

class CustomLeftAppBar extends StatelessWidget {
  CustomLeftAppBar(
      {super.key,
      required this.isOpened,
      required this.widthDevice,
      required this.selectPage});
  final bool isOpened;
  final double widthDevice;
  final Function(int) selectPage;

  late final titleAndIconWidget = [
    NavigationRailDestination(
      icon: IconTabBar(
        icon: Icons.dashboard_outlined,
        top: 60,
        isOpened: isOpened,
      ),
      label: const Text('Dashboard'),
    ),
    NavigationRailDestination(
      icon: IconTabBar(
        icon: Icons.people_outline_outlined,
        top: 130,
        isOpened: isOpened,
      ),
      label: const Text('Employee'),
    ),
    NavigationRailDestination(
      icon: IconTabBar(
        icon: Icons.assignment_outlined,
        top: 203,
        isOpened: isOpened,
      ),
      label: const Text('Project'),
    ),
    NavigationRailDestination(
      icon: IconTabBar(
        icon: Icons.person_outline,
        top: 273,
        isOpened: isOpened,
      ),
      label: const Text('Profile'),
    ),
    NavigationRailDestination(
      icon: IconTabBar(
        icon: Icons.mail_outline,
        top: 273,
        isOpened: isOpened,
      ),
      label: const Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      assignId: true,
      id: Utils.idLeftNavigatorBar,
      autoRemove: false,
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
          destinations: titleAndIconWidget,
        );
      },
    );
  }
}

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

class IconTabBar extends StatefulWidget {
  const IconTabBar(
      {super.key,
      required this.icon,
      required this.top,
      required this.isOpened});
  final IconData icon;
  final double top;
  final bool isOpened;

  @override
  State<IconTabBar> createState() => _IconTabBarState();
}

class _IconTabBarState extends State<IconTabBar> {
  OverlayState? overlayState;

  OverlayEntry? overlayEntry;

  FocusNode focusNode = FocusNode();

  bool showOverlay = false;

  final key = UniqueKey();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        openMenu(context);
      } else {
        overlayEntry!.remove();
      }
    });
  }

  void openMenu(BuildContext context) {
    overlayState = Overlay.of(context)!;

    overlayEntry = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            left: 72,
            top: widget.top,
            child: Focus(
              child: MouseRegion(
                onExit: (event) {
                  showOverlay = false;
                  focusNode.unfocus();
                },
                onHover: (event) {
                  if (showOverlay) {
                    focusNode.requestFocus();
                  }
                },
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            focusNode.unfocus();
                          },
                          child: const Text(
                            'Choice 1',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Choice 2',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Choice 3',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });

    overlayState!.insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      canRequestFocus: true,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          if (!widget.isOpened) {
            if (!focusNode.hasFocus) {
              focusNode.requestFocus();
              showOverlay = true;
            }
          }
        },
        onExit: (event) {
          focusNode.unfocus();
        },
        child: SizedBox(
          width: 200,
          child: Icon(
            widget.icon,
            size: Utils.iconSize,
          ),
        ),
      ),
    );
  }
}
