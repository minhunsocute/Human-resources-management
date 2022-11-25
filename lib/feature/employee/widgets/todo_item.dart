import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';

import '../../../constants/app_color.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  final String title;
  final Animation<Offset> animation;
  final DateTime time;
  final int type;
  final void Function() checkItem;
  TodoItem({
    Key? key,
    required this.title,
    required this.time,
    required this.type,
    required this.animation,
    required this.checkItem,
  }) : super(key: key);

  var checkBoxValue = false.obs;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  value: checkBoxValue.value,
                  onChanged: (value) async {
                    checkBoxValue.value = value!;
                    if (checkBoxValue.value == true) {
                      Future.delayed(
                          const Duration(milliseconds: 300), checkItem);
                    }
                  },
                )),
            const SizedBox(width: 10.0),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.textColor, fontSize: 17.0),
                ),
                const SizedBox(height: 3.0),
                Row(
                  children: [
                    Text(
                      '${time.day}/${time.month}/${time.year} ',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 17.0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        padding: Utils.edgeInsetsHor10Ver5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: type == 0
                              ? Colors.purple.withOpacity(0.3)
                              : type == 1
                                  ? Colors.blue.withOpacity(0.3)
                                  : Colors.red.withOpacity(0.3),
                        ),
                        child: Text(
                          type == 0
                              ? 'Dude'
                              : type == 1
                                  ? 'Done'
                                  : 'Expried',
                          style: TextStyle(
                              color: type == 0
                                  ? Colors.purple
                                  : type == 1
                                      ? Colors.blue
                                      : Colors.red,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
