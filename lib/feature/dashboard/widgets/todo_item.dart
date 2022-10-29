import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final DateTime time;
  final int type;
  const TodoItem({
    Key? key,
    required this.title,
    required this.time,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(color: AppColors.textColor, fontSize: 17.0),
              ),
              const SizedBox(height: 3.0),
              Row(
                children: [
                  Text(
                    '${time.day}/${time.month}/${time.year} ',
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: type == 0
                            ? Colors.purple.withOpacity(0.3)
                            : type == 1
                                ? Colors.blue.withOpacity(0.3)
                                : Colors.red.withOpacity(0.3),
                      ),
                      child: Text(
                        type == 0
                            ? 'Dude Tommorrow'
                            : type == 1
                                ? 'Done'
                                : 'Expried',
                        style: TextStyle(
                            color: type == 0
                                ? Colors.purple
                                : type == 1
                                    ? Colors.blue
                                    : Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
