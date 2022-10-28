import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class Card1 extends StatelessWidget {
  final Map<String, dynamic> e;
  const Card1({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.04),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              e['title'],
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: AppColors.textColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                Text(
                  e['data'].toString(),
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                e['percent'] < 0
                    ? const Icon(Icons.trending_down_rounded, color: Colors.red)
                    : const Icon(Icons.trending_up_rounded,
                        color: Colors.green),
                Text(
                  e['percent'].toString(),
                  style: TextStyle(
                    color: e['percent'] < 0 ? Colors.red : Colors.green,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
