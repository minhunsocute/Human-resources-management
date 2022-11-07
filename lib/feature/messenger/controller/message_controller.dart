import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  Rx<List<String>> messages = Rx<List<String>>([
    'asdfasdfasdfasdfasdfasdfasdf',
    'asdfsadfsadfasdfasdfasdf',
    'sadfsadfasdfasdfsadf',
  ]);

  ScrollController scrollController = ScrollController();

  void addMessage(String message) {
    print(message);
    messages.value.insert(0, message);
    update(['test']);
    print(scrollController.position.maxScrollExtent);
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
