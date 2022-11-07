import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/feature/employ/screens/employ_main_screen.dart';
import '../../../constants/app_color.dart';
import '../../../constants/fake_data.dart';
import '../../../constants/reponsiveness.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import '../../../constants/utils.dart';
import '../widgets/mail_item.dart';
import '../widgets/mail_view_item.dart';
import '../widgets/pop_up_button.dart';

class MailNotificationScreen extends StatelessWidget {
  MailNotificationScreen({super.key});
  RxInt check = 0.obs;
  quill.QuillController _controller = quill.QuillController.basic();
  RxBool checkUread = false.obs;
  RxInt showViewMessIndex = 0.obs;
  Rx<Color> colorFont = Colors.black.obs;
  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: AppColors.textColor.withOpacity(0.3), blurRadius: 10.0),
    ],
  );
  RxInt selectPageView = 1.obs;
  RxList<Map<String, dynamic>> listPageView = <Map<String, dynamic>>[
    {
      'type': 0,
      'title': 'Phuc Khao Diem CC j day t dell biet',
    },
    {
      'type': 1,
      'title': 'Khong co chu de',
    }
  ].obs;
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return SingleChildScrollView(
      child: Column(
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
                        press: () {
                          if (e['message'] == 'Change LeftBar') {}
                        },
                      )),
                  Container(
                      height: 30.0, width: 0.2, color: AppColors.textColor),
                  const SizedBox(width: 10),
                  ...listPopupButtonField2.map((e) => PopupButton(
                        message: e['message'],
                        child: e['child'],
                        color: e['color'],
                        press: () {},
                      )),
                  Container(
                      height: 30.0, width: 0.2, color: AppColors.textColor),
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
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  ...listPopupButtonField2.map((e) => PopupButton(
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
                          press: () {
                            listPageView.value.add(
                              {
                                'type': 0,
                                'title': 'Phuc Khao Diem CC j day t dell biet',
                              },
                            );
                            showViewMessIndex.value = 0;
                          },
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
                          press: () => showViewMessIndex.value = 0,
                          func: (value) {
                            check.value = value!;
                          }),
                      MailItem(
                          headerTitle: "Instagram",
                          icon: const Icon(FontAwesome.instagram,
                              color: Colors.pink),
                          leadTitlte:
                              '[Instagram] You have comm ited to github',
                          title: 'Hey minhunsocute!A third Party will adsad',
                          time: DateTime.now(),
                          checkRead: false,
                          index: 2,
                          groupValue: check.value,
                          press: () => showViewMessIndex.value = 0,
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
                          leadTitlte:
                              '[Minh Hung] You have comm ited to github',
                          title: 'Hey minhunsocute!A third Party will adsad',
                          time: DateTime.now(),
                          checkRead: true,
                          index: 3,
                          groupValue: check.value,
                          press: () => showViewMessIndex.value = 0,
                          func: (value) {
                            check.value = value!;
                          }),
                      MailItem(
                          headerTitle: "Twitter",
                          icon: const Icon(FontAwesome.twitter,
                              color: Colors.blue),
                          leadTitlte: '[Twitter] You have comm ited to github',
                          title: 'Hey minhunsocute!A third Party will adsad',
                          time: DateTime.now(),
                          checkRead: false,
                          index: 4,
                          groupValue: check.value,
                          press: () => showViewMessIndex.value = 0,
                          func: (value) {
                            check.value = value!;
                          }),
                    ]),
                  ),
                ),
                Obx(
                  () => showViewMessIndex.value == 0
                      ? FieldAutoHere(
                          isSmallScreen: isSmallScreen,
                          child: Container(
                            width: double.infinity,
                            height: heightDevice,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            color: AppColors.greyBackgroundCOlor,
                            child: Column(children: [
                              listPageView.value.isEmpty
                                  ? Expanded(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.delete,
                                                color: Colors.grey, size: 40.0),
                                            SizedBox(height: 5.0),
                                            Text(
                                              'Select Mail',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : listPageView.value[selectPageView.value]
                                              ['type'] ==
                                          0
                                      ? _viewMessafeField(isSmallScreen)
                                      : _viewSendMessage(isSmallScreen),
                              const SizedBox(height: 10.0),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: AppColors.backgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.textColor.withOpacity(0.4),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i = 0;
                                          i < listPageView.value.length;
                                          i++)
                                        InkWell(
                                          onTap: () => selectPageView.value = i,
                                          child: Container(
                                            width: 200,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 10.0),
                                            margin: const EdgeInsets.only(
                                                right: 10.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: selectPageView.value == i
                                                  ? Colors.blue
                                                  : Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.textColor
                                                      .withOpacity(0.2),
                                                  blurRadius: 3.0,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    listPageView.value[i]
                                                        ['title'],
                                                    style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: selectPageView
                                                                  .value ==
                                                              i
                                                          ? Colors.white
                                                          : AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Icon(Icons.close,
                                                      color: selectPageView
                                                                  .value ==
                                                              i
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        )
                      : Utils.emptySizeBox,
                ),
                // _viewSendMessage(isSmallScreen, heightDevice, context)
                // Obx(() => showViewMessIndex.value != -1
                //     ? _viewMessafeField(isSmallScreen, heightDevice)
                //     : Utils.emptySizeBox)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _viewSendMessage(bool isSmallScreen) {
    var heightDevice = MediaQuery.of(Get.context!).size.height;
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: heightDevice / 1.5,
            child: Column(
              children: [
                const RowButtonEditText(title: "To"),
                const RowButtonEditText(title: "Cc"),
                TextFormField(
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Them Chu De',
                    hintStyle: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: quill.QuillEditor.basic(
                      controller: _controller, readOnly: false),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColors.greyBackgroundCOlor,
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  quill.QuillToolbar.basic(controller: _controller),
                  const SizedBox(width: 10.0),
                  PopupButton(
                    message: 'Send Messaeg',
                    color: Colors.blue,
                    press: () {},
                    child: Row(
                      children: const [
                        Icon(
                          FontAwesome.send,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        Text(
                          ' Send',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewMessafeField(bool isSmallScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: decoration,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                isSmallScreen
                    ? InkWell(
                        onTap: () => showViewMessIndex.value = -1.obs,
                        child: const Icon(Icons.close, color: Colors.black),
                      )
                    : Utils.emptySizeBox,
                const Text(
                  ' Phuc Khao diem co so du lieu',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        MailViewItem(
          decoration: decoration,
          name: 'Nguyen Minh Hung',
          gmail: '<hungnguyen.201102ak@gmail.com>',
          toMail: 'hung.201102ak@gmail.com',
          title:
              'Em tên Nguyễn Minh Hưng , MSSV là 20120491\nDạ thưa cô em có đi học, làm bài kiểm tra với làm bài nhóm nộp bài\nđầy đủ mà sao lại không có bài được ạ.\nMong cô xem lại bài của em với ạ. Em chân thành cảm ơn!',
          iconHeader: const Icon(FontAwesome.github, size: 40.0),
          time: DateTime.now(),
          messBefore:
              'Em tên Nguyễn Minh Hưng , MSSV là 20120491\nDạ thưa cô em có đi học, làm bài kiểm tra với làm bài nhóm nộp bài\nđầy đủ mà sao lại không có bài được ạ.\nMong cô xem lại bài của em với ạ. Em chân thành cảm ơn!',
          gmailSendBefore: '20120491@student.hcmus.edu.vn',
          timeMessBefore: DateTime.now(),
        ),
        const SizedBox(height: 5.0),
        MailViewItem(
          decoration: decoration,
          name: 'Truong Huynh Duc Hoang',
          gmail: '<hoangankin.201102ak@gmail.com>',
          toMail: 'hoangankin.201102ak@gmail.com',
          title:
              'Em tên Nguyễn Minh Hưng , MSSV là 20120491\nDạ thưa cô em có đi học, làm bài kiểm tra với làm bài nhóm nộp bài\nđầy đủ mà sao lại không có bài được ạ.\nMong cô xem lại bài của em với ạ. Em chân thành cảm ơn!',
          iconHeader:
              const Icon(FontAwesome.instagram, size: 40.0, color: Colors.pink),
          time: DateTime.now(),
          messBefore:
              'Em tên Nguyễn Minh Hưng , MSSV là 20120491\nDạ thưa cô em có đi học, làm bài kiểm tra với làm bài nhóm nộp bài\nđầy đủ mà sao lại không có bài được ạ.\nMong cô xem lại bài của em với ạ. Em chân thành cảm ơn!',
          gmailSendBefore: '20120491@student.hcmus.edu.vn',
          timeMessBefore: DateTime.now(),
        )
      ],
    );
  }
}

class RowButtonEditText extends StatelessWidget {
  final String title;
  const RowButtonEditText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.0,
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.3),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: TextFormField(
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                fontSize: 18.0),
          ),
        ),
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

class HeaderField extends StatelessWidget {
  final bool isSmallScreen;
  final Widget child;
  const HeaderField(
      {super.key, required this.isSmallScreen, required this.child});

  @override
  Widget build(BuildContext context) {
    return isSmallScreen
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: child)
        : Container(
            height: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: child);
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
