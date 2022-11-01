import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/app_color.dart';

class EmployeeProgressItem extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String email;
  final double amount;
  final String phoneNumber;
  final DateTime time;
  final double percent;
  const EmployeeProgressItem({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
    required this.email,
    required this.phoneNumber,
    required this.amount,
    required this.time,
    required this.percent,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.centerLeft,
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
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              name,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: LinearPercentIndicator(
              percent: percent,
              backgroundColor: Colors.grey.withOpacity(0.2),
              progressColor: percent > 0.6
                  ? Colors.green.withOpacity(0.8)
                  : Colors.red.withOpacity(0.8),
              // ignore: deprecated_member_use
              barRadius: Radius.circular(20.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '\$$amount ',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  child: Text(
                    '${time.day}/${time.month}/${time.year}',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
