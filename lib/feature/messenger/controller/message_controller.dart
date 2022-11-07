import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/document_file_widget.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/image_file_widget.dart';
import 'package:ueh_project_admin/feature/messenger/widgets/message_widget.dart';

class MessageController extends GetxController {
  Rx<List<Widget>> messages = Rx<List<Widget>>([
    MessageWidget(
      message: 'asdfasdfasdfasdfasdfasdfasdf',
    ),
    MessageWidget(
      message: 'asdfasdfasdfasdfas',
    ),
    MessageWidget(
      message: 'asdfasdfasdfasdf',
    ),
    DocumentFileWidget(filename: "Dit me may hung.ext", size: 999),
    ImageFileWidget(imageNumber: 7),
  ]);

  ScrollController scrollController = ScrollController();

  void addMessage(String message) {
    print(message);
    messages.value.insert(0, MessageWidget(message: message));
    update(['test']);
    print(scrollController.position.maxScrollExtent);
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
