import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() press;
  final IconData icon;
  const SettingItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.press,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue, size: 18.0),
        const SizedBox(width: 5.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: press,
          child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: const Icon(Icons.edit, color: Colors.grey, size: 20.0)),
        ),
      ],
    );
  }
}
