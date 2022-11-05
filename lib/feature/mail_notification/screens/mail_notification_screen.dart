import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';

import '../../../constants/app_color.dart';
import '../../../constants/fake_data.dart';
import '../../../constants/reponsiveness.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../constants/utils.dart';

class MailNotificationScreen extends StatelessWidget {
  MailNotificationScreen({super.key});
  RxInt check = 0.obs;
  RxBool checkUread = false.obs;
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.4),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...listPopupButton.map((e) => PopupButton(
                      message: e['message'],
                      child: e['child'],
                      color: e['color'],
                      press: () {},
                    )),
                Container(height: 30.0, width: 0.2, color: AppColors.textColor),
                const SizedBox(width: 10),
                ...listPopupButtonField2.map((e) => PopupButton(
                      message: e['message'],
                      child: e['child'],
                      color: e['color'],
                      press: () {},
                    )),
                Container(height: 30.0, width: 0.2, color: AppColors.textColor),
                const SizedBox(width: 10),
                ...listPopupButtonField3.map((e) => PopupButton(
                      message: e['message'],
                      child: e['child'],
                      color: e['color'],
                      press: () {},
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          width: double.infinity,
          height: heightDevice,
          child: RowField3(
            isSmallScreen: isSmallScreen,
            // checkSmallScreen: isSmallScreen,
            childre: [
              Obx(
                () => Container(
                  width: !isSmallScreen ? 350 : double.infinity,
                  height: heightDevice,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textColor.withOpacity(0.2),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkUread.value,
                            onChanged: (value) => checkUread.value = value!,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              '${checkUread.value ? 'Read' : 'Un Read'} (120 Items)',
                              style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      color: AppColors.greyBackgroundCOlor,
                      alignment: Alignment.center,
                      child: const Text(
                        'December',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                    MailItem(
                        headerTitle: "Git Hub",
                        icon: const Icon(FontAwesome.github),
                        leadTitlte: '[Github] You have comm ited to github',
                        title: 'Hey minhunsocute!A third Party will adsad',
                        time: DateTime.now(),
                        checkRead: true,
                        index: 0,
                        groupValue: check.value,
                        func: (value) {
                          check.value = value!;
                        }),
                    MailItem(
                        headerTitle: "Facebook",
                        icon: const Icon(FontAwesome.facebook,
                            color: Colors.blue),
                        leadTitlte: '[Facebook] You have comm ited to github',
                        title: 'Hey minhunsocute!A third Party will adsad',
                        time: DateTime.now(),
                        checkRead: false,
                        index: 1,
                        groupValue: check.value,
                        func: (value) {
                          check.value = value!;
                        }),
                    MailItem(
                        headerTitle: "Instagram",
                        icon: const Icon(FontAwesome.instagram,
                            color: Colors.pink),
                        leadTitlte: '[Instagram] You have comm ited to github',
                        title: 'Hey minhunsocute!A third Party will adsad',
                        time: DateTime.now(),
                        checkRead: false,
                        index: 2,
                        groupValue: check.value,
                        func: (value) {
                          check.value = value!;
                        }),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      color: AppColors.greyBackgroundCOlor,
                      alignment: Alignment.center,
                      child: const Text(
                        'November',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                    MailItem(
                        headerTitle: "Email",
                        icon: const Icon(Icons.mail, color: Colors.blue),
                        leadTitlte: '[Minh Hung] You have comm ited to github',
                        title: 'Hey minhunsocute!A third Party will adsad',
                        time: DateTime.now(),
                        checkRead: true,
                        index: 3,
                        groupValue: check.value,
                        func: (value) {
                          check.value = value!;
                        }),
                    MailItem(
                        headerTitle: "Twitter",
                        icon:
                            const Icon(FontAwesome.twitter, color: Colors.blue),
                        leadTitlte: '[Twitter] You have comm ited to github',
                        title: 'Hey minhunsocute!A third Party will adsad',
                        time: DateTime.now(),
                        checkRead: false,
                        index: 4,
                        groupValue: check.value,
                        func: (value) {
                          check.value = value!;
                        }),
                  ]),
                ),
              ),
              FieldAutoHere(
                isSmallScreen: isSmallScreen,
                child: Container(
                  height: heightDevice,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textColor.withOpacity(0.2),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class RowField3 extends StatelessWidget {
  final bool isSmallScreen;
  final List<Widget> childre;
  const RowField3(
      {super.key, required this.childre, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return isSmallScreen
        ? Stack(children: childre)
        : Row(
            children: childre,
          );
  }
}

class FieldAutoHere extends StatelessWidget {
  final bool isSmallScreen;
  final Widget child;
  const FieldAutoHere(
      {super.key, required this.isSmallScreen, required this.child});

  @override
  Widget build(BuildContext context) {
    return isSmallScreen
        ? child
        : Expanded(
            child: child,
          );
  }
}

class PopupButton extends StatelessWidget {
  final String message;
  final Widget child;
  final Color color;
  final Function() press;
  const PopupButton({
    Key? key,
    required this.message,
    required this.child,
    required this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

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
      required this.func});
  RxBool onIt = false.obs;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => onIt.value = true,
      onExit: (value) => onIt.value = false,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                          value: index, groupValue: groupValue, onChanged: func)
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
    );
  }
}
