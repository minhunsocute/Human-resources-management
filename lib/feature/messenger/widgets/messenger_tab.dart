import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessengerTab extends StatelessWidget {
  MessengerTab({super.key, required this.width});
  final double width;

  var isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: width,
            child: ListTile(
              selected: isSelected.value,
              selectedColor: Colors.white,
              selectedTileColor: Color.fromARGB(255, 59, 141, 207),
              onTap: () {
                isSelected.value = !isSelected.value;
              },
              isThreeLine: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              focusNode: FocusNode(),
              horizontalTitleGap: 15,
              minLeadingWidth: 30,
              minVerticalPadding: 15,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              leading: Icon(
                Icons.person,
                size: 40,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Online',
                    style: TextStyle(
                        color: isSelected.value
                            ? Color.fromARGB(255, 200, 197, 197)
                            : Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hoang Ankin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              subtitle: Text(
                "This is a dummy messeage: abcdergsafsadfasdfasdfasdfasdfasdfasdf",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              trailing: Text(
                '12:45',
                style: TextStyle(
                    color: isSelected.value
                        ? Color.fromARGB(255, 200, 197, 197)
                        : Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
