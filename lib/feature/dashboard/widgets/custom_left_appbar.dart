import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';

import '../../../constants/app_color.dart';
import 'appbar_item.dart';

class CustomLeftAppBar extends StatefulWidget {
  const CustomLeftAppBar(
      {super.key,
      required this.isOpened,
      required this.openAppBar,
      required this.widthDevice});
  final bool isOpened;
  final double widthDevice;
  final Function() openAppBar;
  @override
  State<CustomLeftAppBar> createState() => _CustomLeftAppBarState();
}

class _CustomLeftAppBarState extends State<CustomLeftAppBar> {
  double turns = 0;

  Rx<int> selectedChoice = 0.obs;

  void selectPage(int value) {
    selectedChoice.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      curve: Curves.linear,
      duration: Utils.animationDuration,
      width: widget.isOpened
          ? widget.widthDevice * 0.12
          : widget.widthDevice * 0.04,
      child: Material(
        color: widget.isOpened ? AppColors.greyBackgroundCOlor : Colors.white,
        child: Focus(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                      FutureBuilder(
                          future: Future.delayed(
                              Utils.animationDuration, () => true),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                if (snapshot.data as bool) {
                                  return RichText(
                                      text: Utils.starAdminTextSpan);
                                }
                              }
                            }
                            return Utils.emptySizeBox;
                          }),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              AppBarItem(
                isOpened: widget.isOpened,
                title: 'Dashboard',
                icon: Icons.dashboard_outlined,
                index: 0,
                selectPage: selectPage,
              ),
              Utils.spaceBetweenTabBarItem,
              AppBarItem(
                isOpened: widget.isOpened,
                title: 'Employees',
                icon: Icons.people_outlined,
                index: 1,
                selectPage: selectPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
