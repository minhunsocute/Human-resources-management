import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/reponsiveness.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCustomScreen = ResponsiveWidget.isSmallCustomSize(context);
    final isSmasllScreen = ResponsiveWidget.isSmallScreen(context);
    var heightDevice = MediaQuery.of(context).size.height;
    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/sea.jpg'),
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.textColor.withOpacity(0.4),
          blurRadius: 10.0,
        ),
      ],
    );
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Container(
          width: isCustomScreen ? double.infinity : 1100,
          height: heightDevice / 3,
          decoration: decoration,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: isCustomScreen ? double.infinity : 1100,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.4),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/person.png'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textColor.withOpacity(0.4),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        const Divider(thickness: 1),
        const SizedBox(height: 10.0),
        Container(
          width: isCustomScreen ? double.infinity : 1100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.4),
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
