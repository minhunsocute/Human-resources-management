import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/messenger/controller/message_controller.dart';

// ignore: must_be_immutable
class TypeMessageField extends StatelessWidget {
  TypeMessageField({super.key});
  TextEditingController typeMessage = TextEditingController();
  final messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      autofocus: true,
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          messageController.addMessage(value);
          typeMessage.clear();
        }
      },
      controller: typeMessage,
      decoration: InputDecoration(
        prefixIcon: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.attach_file,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.image,
                  color: Colors.grey,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            messageController.addMessage(typeMessage.text);
          },
          icon: const Icon(
            Icons.send,
            color: Colors.blue,
          ),
        ),
        border: InputBorder.none,
        hintText: "Type Message",
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
