import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/utils.dart';

// ignore: must_be_immutable
class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
    required this.isOpened,
    required this.title,
    required this.icon,
    required this.index,
    required this.selectPage,
  });
  final int index;
  final String title;
  final IconData icon;
  final bool isOpened;
  final Function(int) selectPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white60,
      focusColor: Colors.white60,
      borderRadius: Utils.appBarItemBorder,
      onTap: () {
        selectPage(index);
      },
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Icon(
              icon,
              size: 28,
              color: Colors.black,
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
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
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
