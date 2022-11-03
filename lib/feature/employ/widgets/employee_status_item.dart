import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class EmployeeStatusItem extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String email;
  final int status;
  const EmployeeStatusItem({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
    required this.email,
    required this.status,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                      Text(
                        type,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(email,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400)),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: (status == 0)
                        ? Colors.white
                        : Colors.green.withOpacity(0.3),
                    border: Border.all(
                        width: 1,
                        color: status == 0 ? Colors.grey : Colors.green),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    status == 1 ? 'Active' : 'In-Active',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: status == 0 ? Colors.grey : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: status == 0 ? Colors.red : Colors.green),
                ),
                Text(
                  status == 0 ? 'Offline' : ' Online',
                  style: const TextStyle(
                      color: AppColors.textColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
