import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ueh_project_admin/feature/messenger/controller/message_controller.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/bottom_toolbar.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/chat_widget.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/image_file_widget.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/message_toolbar.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/message_widget.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/messenger_tab.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/search_widget.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/type_message_field.dart';

import '../widgets/document_file_widget.dart';

// ignore: must_be_immutable
class MainMessengerScreen extends StatelessWidget {
  MainMessengerScreen({super.key});

  final messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth * 0.22,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Column(
                    children: [
                      SearchBox(),
                      const Divider(),
                      SizedBox(
                        height: Get.height * 0.8,
                        child: ListView(
                          children: ListTile.divideTiles(
                            color: Colors.grey[400],
                            context: context,
                            tiles: [
                              MessengerTab(
                                width: constraints.maxWidth * 0.22,
                              ),
                              MessengerTab(
                                width: constraints.maxWidth * 0.22,
                              ),
                              MessengerTab(
                                width: constraints.maxWidth * 0.22,
                              ),
                            ],
                          ).toList(),
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BottomToolBar(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(20)),
                  child: ColoredBox(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const MessageToolbar(),
                          const SizedBox(height: 8),
                          const Divider(
                            thickness: 0.2,
                            color: Colors.grey,
                            height: 40,
                          ),
                          SizedBox(
                            height: Get.height * 0.8,
                            child: GetBuilder<MessageController>(
                              assignId: true,
                              id: 'test',
                              autoRemove: false,
                              builder: (controller) => ListView.builder(
                                reverse: true,
                                controller: messageController.scrollController,
                                itemBuilder: (context, index) {
                                  return ChatWidget(
                                    textDirection: TextDirection.rtl,
                                    name: "Hoang Ankin",
                                    displayMessage: MessageWidget(
                                      message: messageController
                                          .messages.value[index],
                                    ),
                                  );
                                },
                                itemCount:
                                    messageController.messages.value.length,
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.2,
                            color: Colors.grey,
                            height: 0,
                          ),
                          TypeMessageField(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
