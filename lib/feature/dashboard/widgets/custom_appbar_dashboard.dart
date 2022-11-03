import 'package:flutter/material.dart';
import 'package:ueh_project_admin/constants/utils.dart';

import '../../../constants/reponsiveness.dart';

class CustomAppBarDashboard extends StatelessWidget {
  const CustomAppBarDashboard(
      {super.key, required this.scaffoldDashboardScreenKey});
  final GlobalKey<ScaffoldState> scaffoldDashboardScreenKey;
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return SizedBox(
      child: Row(
        children: [
          (isSmallScreen)
              ? Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'images/ueh_logo.jpg',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Good Morning, ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: 'UEH',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Your performance summary this week',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
          const Spacer(),
          Row(
            children: [
              if (!isSmallScreen) ...[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "Select Category",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 30,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                              vertical: BorderSide(width: 0.1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            '10/28/2022',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: const Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              if (!isSmallScreen) ...[
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Utils.faceImage,
                  ),
                )
              ] else ...[
                InkWell(
                  onTap: () {
                    scaffoldDashboardScreenKey.currentState!.openEndDrawer();
                  },
                  child: const Icon(Icons.menu_outlined),
                ),
                const SizedBox(width: 10),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
