import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';

class HeaderField extends StatelessWidget {
  const HeaderField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Time Line',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                'Create and complete taks using dashboards',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.backgroundColor,
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.textColor,
                    ),
                    Text(
                      ' ${DateFormat().add_yMMM().format(DateTime.now())}',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.purple.withOpacity(0.2),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.add, color: Colors.purple),
                    Text(
                      ' Invite',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add, color: Colors.white),
                      Text(
                        ' Add Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
