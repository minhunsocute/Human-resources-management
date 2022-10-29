import 'package:flutter/material.dart';

import '../../../constants/utils.dart';

class AppBarItem extends StatelessWidget {
  AppBarItem(
      {super.key,
      required this.isOpened,
      required this.title,
      required this.icon,
      required this.index,
      required this.selectPage});
  final int index;
  final String title;
  final Icon icon;
  final bool isOpened;
  final Function(int) selectPage;

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: focus,
      hoverColor: Colors.white60,
      focusColor: Colors.white60,
      borderRadius: Utils.appBarItemBorder,
      onTap: () {
        focus.requestFocus();
        selectPage(index);
      },
      child: Container(
        decoration: (focus.hasFocus && !isOpened)
            ? Utils.blueVerticalLineTabBarItem
            : null,
        padding: Utils.appBarItemPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            if (isOpened)
              FutureBuilder(
                future: Future.delayed(
                  const Duration(milliseconds: 80),
                  () => true,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (snapshot.data as bool) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            title,
                            style: Utils.textStyleTabBarItem,
                          ),
                        );
                      }
                    }
                  }
                  return const SizedBox();
                },
              ),
          ],
        ),
      ),
    );
  }
}
