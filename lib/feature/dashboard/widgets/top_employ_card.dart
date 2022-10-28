import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class TopEmployCard extends StatelessWidget {
  final String image;
  final String name;
  final DateTime time;
  final double point;
  const TopEmployCard({
    Key? key,
    required this.image,
    required this.name,
    required this.time,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.textColor.withOpacity(0.6),
                  blurRadius: 10.0),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              const SizedBox(height: 7.0),
              Text(
                '${time.day}/${time.month}/${time.year}',
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.green),
            color: Colors.green.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            '$point Point',
            style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
        ),
      ],
    );
  }
}
