import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';

class CurrentActivityItem extends StatelessWidget {
  final String title;
  final DateTime time;
  final int status;
  const CurrentActivityItem({
    Key? key,
    required this.title,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.primarySecondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                Text(
                  DateFormat().add_jm().format(time),
                  style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
          ),
          const SizedBox(width: 3),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (status == 0) ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
