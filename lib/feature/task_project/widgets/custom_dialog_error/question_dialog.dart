import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    Key? key,
    required this.question,
    required this.title1,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  final String question;
  final String title1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Badge(
        position: BadgePosition.topStart(
          top: -45,
          start: 105,
        ),
        badgeColor: Colors.white,
        padding: const EdgeInsets.all(10),
        stackFit: StackFit.passthrough,
        elevation: 0,
        badgeContent: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.blueGrey[50],
          child: Icon(
            icon,
            color: color,
            size: 35.0,
          ),
        ),
        child: SizedBox(
          height: 230,
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 70,
                width: Get.mediaQuery.size.width * 0.7,
                child: Text(
                  title1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => Get.back(result: true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.withOpacity(0.3),
                        // primary: Colors.green.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        fixedSize: const Size(110, 50),
                        elevation: 0,
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                      onPressed: () => Get.back(result: true),
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.green.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        fixedSize: const Size(110, 50),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
