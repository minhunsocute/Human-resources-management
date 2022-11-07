import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';
import '../../../constants/utils.dart';

class MailItem extends StatelessWidget {
  final String headerTitle;
  final Widget icon;
  final String leadTitlte;
  final String title;
  final bool checkRead;
  final DateTime time;
  final int index;
  final int groupValue;
  final Function(int?) func;
  final Function() press;
  MailItem(
      {super.key,
      required this.headerTitle,
      required this.icon,
      required this.leadTitlte,
      required this.title,
      required this.time,
      required this.checkRead,
      required this.index,
      required this.groupValue,
      required this.func,
      required this.press});
  RxBool onIt = false.obs;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => onIt.value = true,
      onExit: (value) => onIt.value = false,
      child: Obx(
        () => InkWell(
          onTap: press,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: onIt.value ? AppColors.greyBackgroundCOlor : Colors.white,
              border: Border(
                bottom: const BorderSide(color: Colors.grey, width: 0.2),
                left: BorderSide(
                    width: 5,
                    color: checkRead ? Colors.transparent : Colors.blue),
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    onIt.value
                        ? Radio(
                            value: index,
                            groupValue: groupValue,
                            onChanged: func)
                        : icon,
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  headerTitle,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              onIt.value
                                  ? InkWell(
                                      onTap: () {},
                                      child: const Icon(Icons.mail_outline,
                                          size: 18.0),
                                    )
                                  : Utils.emptySizeBox,
                              const SizedBox(width: 10.0),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  leadTitlte,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  DateFormat().add_yMd().format(time),
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.delete,
                        color: onIt.value ? Colors.red : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
