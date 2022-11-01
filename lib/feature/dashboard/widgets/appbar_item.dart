import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final IconData icon;
  final bool isOpened;
  final Function(int) selectPage;

  late final focus = FocusNode();
  var isFocus = false.obs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: Border.all(),
      onFocusChange: (value) {
        isFocus.value = value;
      },
      focusNode: focus,
      hoverColor: Colors.white60,
      focusColor: Colors.white60,
      borderRadius: Utils.appBarItemBorder,
      onTap: () {
        focus.requestFocus();
        selectPage(index);
      },
      child: Row(
        children: [
          Obx(() => (!isOpened && isFocus.value)
              ? Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.blue, width: 3),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 40,
                )),
          Obx(
            () => Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Icon(
                icon,
                size: 28,
                color: isFocus.value ? Colors.blueAccent : Colors.black,
              ),
            ),
          ),
          if (isOpened)
            FutureBuilder(
              future: Future.delayed(
                Utils.animationDuration,
                () => true,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    if (snapshot.data as bool) {
                      return Expanded(
                        child: Obx(() => Text(
                              title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: isFocus.value
                                    ? Colors.blueAccent
                                    : Colors.black,
                              ),
                            )),
                      );
                    }
                  }
                }
                return Utils.emptySizeBox;
              },
            ),
        ],
      ),
    );
  }
}
