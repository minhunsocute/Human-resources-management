import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class RecruitmentProgressItem extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String email;
  final int round;
  final String phoneNumber;
  const RecruitmentProgressItem({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
    required this.email,
    required this.round,
    required this.phoneNumber,
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
              email,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              phoneNumber,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              type,
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
                      color: Colors.green,
                    ),
                  ),
                  child: Text(
                    '$round Round',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
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
