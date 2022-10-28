import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/tool_bar_item.dart';

import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Rx<double> widthDrawer = (Get.width * 0.2).obs;
  var isOpened = false.obs;
  double turns = 0.0;

  Widget buildListTitle(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
      hoverColor: Colors.white12,
    );
  }

  void openAppBar() {
    isOpened.value = !isOpened.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: Row(
        children: [
          Obx(() {
            return CustomLeftAppBar(
              isOpened: isOpened.value,
              openAppBar: openAppBar,
            );
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, top: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBarDashboard(),
                    const SizedBox(height: 35),
                    const CustomToolBar(),
                    HomeScreen(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLeftAppBar extends StatefulWidget {
  const CustomLeftAppBar(
      {super.key, required this.isOpened, required this.openAppBar});
  final bool isOpened;
  final Function() openAppBar;
  @override
  State<CustomLeftAppBar> createState() => _CustomLeftAppBarState();
}

class _CustomLeftAppBarState extends State<CustomLeftAppBar> {
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 300),
      width: widget.isOpened ? Get.width * 0.11 : Get.width * 0.03,
      decoration: BoxDecoration(
        color: widget.isOpened ? AppColors.greyBackgroundCOlor : Colors.white,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.openAppBar();
                    turns = turns + (widget.isOpened ? -1 / 2 : 1 / 2);
                  },
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: turns,
                    child: Icon(
                      Icons.menu_outlined,
                      color: Colors.black.withOpacity(0.45),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    text: 'Star',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Admin',
                        style: TextStyle(color: Colors.blue[900]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 0.1, color: Colors.black),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ToolBarTextItem(
            text: 'Issues (2)',
            color: Colors.blue,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
            onTap: () {},
          ),
          ToolBarTextItem(
            text: 'Process',
            color: Colors.black,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
            onTap: () {},
          ),
          ToolBarTextItem(
            text: 'Employees',
            color: Colors.black,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
            onTap: () {},
          ),
          ToolBarTextItem(
            text: 'More',
            color: Colors.black,
            decoration: null,
            onTap: () {},
          ),

          ///////////////////////////////////////////////////////
          const Spacer(),
          ///////////////////////////////////////////////////////

          const ToolBarButtonItem(
            title: 'Share',
            icon: Icon(
              Icons.share_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const ToolBarButtonItem(
            title: 'Print',
            icon: Icon(
              Icons.print_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const ToolBarButtonItem(
            title: 'New',
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarDashboard extends StatelessWidget {
  const CustomAppBarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Column(
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
          // PopupMenuButton(itemBuilder: itemBuilder)
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
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'images/face8.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
