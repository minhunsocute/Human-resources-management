import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.textDirection,
    required this.name,
    required this.displayMessage,
  });
  final TextDirection textDirection;
  final String name;
  final Widget displayMessage;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Get.width * 0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          textDirection: textDirection == TextDirection.ltr
              ? TextDirection.rtl
              : TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: textDirection,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "12:45",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Padding(
              padding: textDirection == TextDirection.ltr
                  ? const EdgeInsets.only(left: 70)
                  : const EdgeInsets.only(right: 70),
              child: Badge(
                badgeColor: Colors.white,
                position: BadgePosition.bottomEnd(),
                animationDuration: Utils.animationDuration,
                elevation: 2,
                badgeContent: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    size: 15,
                  ),
                  onTap: () {},
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ColoredBox(
                    color: Colors.white,
                    child: displayMessage,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
