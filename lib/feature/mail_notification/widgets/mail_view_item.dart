import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';
import '../../../constants/utils.dart';

class MailViewItem extends StatelessWidget {
  final String name;
  final String gmail;
  final String toMail;
  final String title;
  final Widget iconHeader;
  final DateTime time;
  final DateTime timeMessBefore;
  final String messBefore;
  final String gmailSendBefore;
  final BoxDecoration decoration;
  MailViewItem({
    Key? key,
    required this.decoration,
    required this.name,
    required this.gmail,
    required this.toMail,
    required this.title,
    required this.iconHeader,
    required this.time,
    required this.timeMessBefore,
    required this.messBefore,
    required this.gmailSendBefore,
  }) : super(key: key);

  RxBool onIt = false.obs;
  RxBool checkSmallItem = true.obs;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => onIt.value = true,
      onExit: (value) => onIt.value = false,
      child: Obx(() => InkWell(
            onTap: () => checkSmallItem.value = !checkSmallItem.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: checkSmallItem.value
                    ? onIt.value
                        ? AppColors.greyBackgroundCOlor
                        : Colors.white
                    : Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textColor.withOpacity(0.4),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconHeader,
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: name,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: gmail,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                  style: const TextStyle(
                                    color: AppColors.textColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => print(1),
                              child: const Icon(
                                Icons.insert_emoticon_outlined,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () => print(2),
                              child: const Icon(FontAwesome.mail_reply,
                                  color: Colors.blue),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () => print(3),
                              child: const Icon(FontAwesome.mail_forward,
                                  color: Colors.blue),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () => print(4),
                              child: const Icon(Icons.more_horiz,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'To: $toMail',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Text(
                                '${DateFormat().add_yMEd().format(time)} ${DateFormat().add_jm().format(time)}')
                          ],
                        ),
                        !checkSmallItem.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const SizedBox(height: 20.0),
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Text(
                                      'Vào Th ${timeMessBefore.weekday}, ${timeMessBefore.day} thg ${timeMessBefore.month}, ${timeMessBefore.year} vào lúc ${DateFormat().add_jm().format(timeMessBefore)} NGUYỄN MINH HƯNG <$gmailSendBefore> đã viết:',
                                      style: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: Colors.black,
                                                  width: 0.5))),
                                      child: Text(
                                        messBefore,
                                        style: const TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ])
                            : Utils.emptySizeBox,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
