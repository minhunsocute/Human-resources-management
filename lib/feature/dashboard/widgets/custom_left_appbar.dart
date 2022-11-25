import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';

class CustomLeftAppBar extends StatelessWidget {
  CustomLeftAppBar(
      {super.key,
      required this.isOpened,
      required this.widthDevice,
      required this.selectPage,
      required this.scaffoldDashboardScreenKey});

  final bool isOpened;
  final double widthDevice;
  final Function(int) selectPage;
  final GlobalKey<ScaffoldState> scaffoldDashboardScreenKey;

  late final titleAndIconWidget = Utils.titleAndIconList
      .map(
        (e) => NavigationRailDestination(
          icon: IconTabBar(
            icon: e['icon'],
            top: e['position'],
            isOpened: isOpened,
          ),
          label: Text(e['title'] as String),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      assignId: true,
      id: Utils.idLeftNavigatorBar,
      autoRemove: false,
      builder: (controller) {
        return NavigationRail(
          elevation: 5,
          leading: LeftAppBarLeading(
            isOpened: isOpened,
            openAppBar: () => controller.openAppBar(scaffoldDashboardScreenKey),
          ),
          minExtendedWidth: widthDevice * 0.13,
          labelType: NavigationRailLabelType.none,
          backgroundColor: Colors.white,
          extended: isOpened,
          onDestinationSelected: (value) {
            controller.selectPage(value);
            scaffoldDashboardScreenKey.currentState!.closeDrawer();
            scaffoldDashboardScreenKey.currentState!.closeEndDrawer();
          },
          selectedIndex: controller.pageIndex.value,
          destinations: titleAndIconWidget,
        );
      },
    );
  }
}

// ignore: must_be_immutable
class LeftAppBarLeading extends StatelessWidget {
  LeftAppBarLeading({
    super.key,
    required this.openAppBar,
    required this.isOpened,
  });
  final bool isOpened;
  final Function() openAppBar;

  var isOpenedDrawer = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.appBarItemPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (isOpened) ? const SizedBox(width: 25) : const SizedBox(width: 7),
          GestureDetector(
            onTap: () {
              isOpenedDrawer.value = !isOpenedDrawer.value;
              openAppBar();
            },
            child: Obx(
              () => AnimatedRotation(
                duration: const Duration(milliseconds: 350),
                turns: isOpenedDrawer.value ? 1 : -1,
                curve: Utils.curvesAnimation,
                child: const Icon(
                  Icons.menu_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (isOpened) RichText(text: Utils.starAdminTextSpan)
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
