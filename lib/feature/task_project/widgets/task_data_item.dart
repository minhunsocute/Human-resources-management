import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class TaskDataItem extends StatelessWidget {
  final String image;
  final String name;
  final int taskCompleted;
  final int taskUncomleted;
  const TaskDataItem({
    Key? key,
    required this.image,
    required this.name,
    required this.taskCompleted,
    required this.taskUncomleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(image)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.textColor.withOpacity(0.6),
                          blurRadius: 10.0),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$taskCompleted Task',
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$taskUncomleted Task',
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
