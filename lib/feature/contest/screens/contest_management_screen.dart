import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project_admin/feature/auth/screens/sign_in%20_screen.dart';
import 'package:ueh_project_admin/feature/contest/controller/contest_management_controller.dart';
import 'package:ueh_project_admin/feature/contest/widgets/employee_result_row.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_icon_button.dart';
import '../widgets/employee_list_table.dart';
import '../widgets/filter_card.dart';
import '../widgets/show_entries_widget.dart';

List<Map<String, dynamic>> urlWebTestOnline = [
  {
    'url': 'https://www.typeform.com/test-maker/',
    'image': 'images/typeform_logo.png',
  },
  {
    'url': 'https://docs.google.com/forms/u/0/?tgif=d',
    'image': 'images/google_form.png',
  },
  {
    'url':
        'https://www.microsoft.com/vi-vn/microsoft-365/online-surveys-polls-quizzes',
    'image': 'images/microsoft_form.jpg',
  },
  {
    'url': 'https://kahoot.it/',
    'image': 'images/kahoot.png',
  },
];

List<Map<String, dynamic>> fakeStatisticData = [
  {
    'image': CircleAvatar(
      backgroundColor: Colors.amber.withOpacity(0.1),
      radius: 30,
      child: const Icon(
        Icons.person_outline,
        size: 40,
        color: Colors.amber,
      ),
    ),
    'statistic': '400',
    'title': 'Total Employees',
  },
  {
    'image': CircleAvatar(
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      radius: 30,
      child: const Icon(
        Icons.school_outlined,
        size: 40,
        color: Colors.blueGrey,
      ),
    ),
    'statistic': '100',
    'title': 'Average Score',
  },
  {
    'image': CircleAvatar(
      backgroundColor: Colors.orange.withOpacity(0.1),
      radius: 30,
      child: const Icon(
        Icons.info_outline_rounded,
        size: 40,
        color: Colors.orange,
      ),
    ),
    'statistic': '12',
    'title': 'Total Absent Employees',
  },
  {
    'image': CircleAvatar(
      backgroundColor: Colors.purple.withOpacity(0.1),
      radius: 30,
      child: const Icon(
        Icons.check_circle_outline,
        size: 40,
        color: Colors.purple,
      ),
    ),
    'statistic': '365',
    'title': 'Total Finished Employees',
  },
  {
    'image': CircleAvatar(
      backgroundColor: Colors.blue.withOpacity(0.1),
      radius: 30,
      child: const Icon(
        Icons.flag_circle_outlined,
        size: 40,
        color: Colors.blue,
      ),
    ),
    'statistic': '365',
    'title': 'Total Passed Employees',
  },
  {
    'image': CircleAvatar(
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      radius: 30,
      child: const Icon(
        Icons.cancel_outlined,
        size: 40,
        color: Colors.redAccent,
      ),
    ),
    'statistic': '400',
    'title': 'Total Failed Employees',
  },
];

class ContestManagementScreen extends StatelessWidget {
  ContestManagementScreen({super.key});

  final controller = Get.put(ContestManagementController());

  final TextEditingController textController = TextEditingController();

  void showCreateFormDialog() async {
    await Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: Get.height * 0.35,
          width: Get.width * 0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: urlWebTestOnline
                    .map(
                      (e) => InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(e['url']));
                        },
                        child: ClipRRect(
                          child: Image.asset(
                            e['image'],
                            height: 100,
                            // width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Expanded(
                      child: Divider(thickness: 0.3, color: Colors.blueGrey)),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                      child: Divider(thickness: 0.3, color: Colors.blueGrey)),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Url',
                  hintStyle: TextStyle(color: Colors.grey[300], fontSize: 17),
                  prefixIcon: const Icon(
                    Icons.link_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blueGrey[300]!,
                      width: 0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    fixedSize: Size(Get.width * 0.3, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    if (textController.text.isNotEmpty) {
                      await launchUrl(Uri.parse(textController.text));
                    }
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.3,
              color: Colors.blueGrey[300]!,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CardCustom(
                child: Text(
                  'Exam Tracking',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CardCustom(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Exam: English Speaking Level 3',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '20 Questions',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    Flexible(
                      child: StatisticCard(
                        image: fakeStatisticData[i]['image'],
                        statistic: fakeStatisticData[i]['statistic'],
                        title: fakeStatisticData[i]['title'],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ]
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  for (int i = 3; i < 6; i++) ...[
                    Flexible(
                      child: StatisticCard(
                        image: fakeStatisticData[i]['image'],
                        statistic: fakeStatisticData[i]['statistic'],
                        title: fakeStatisticData[i]['title'],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ]
                ],
              ),
              //////////////////////////////////////////////////////////////////\
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Employee List',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  CustomIconButton(
                    onPressed: () {
                      showCreateFormDialog();
                    },
                    label: const Text(
                      'Create new Examination',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    icon: const Icon(
                      Icons.add_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => ShowEntriesWidget(
                      applyEntries: controller.applyEntries,
                      numberOfEntries: controller.numberOfEntries.value - 1,
                      width: constraints.maxWidth * 0.03,
                      height: constraints.maxHeight * 0.05,
                      maxEntries: controller.data.value.length - 1,
                    ),
                  ),
                  CustomIconButton(
                    onPressed: () {},
                    label: const Text(
                      'Filter',
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w500),
                    ),
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.blueGrey,
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.3),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Expanded(
                    child: FilterCategory(
                      title: 'Employee',
                      hint: 'Patient name, Patient id, etc',
                      iconData: Icons.search_outlined,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: FilterCategory(
                      title: 'Grade',
                      hint: 'Example: 9.5, 10, etc',
                      iconData: Icons.category_outlined,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: FilterCategory(
                      title: 'Date',
                      hint: DateFormat()
                          .add_yMd()
                          .format(DateTime.now())
                          .toString(),
                      iconData: Icons.calendar_month_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: controller.numberOfEntries.value * 60,
                child: Obx(
                  () => ListView.builder(
                    itemExtent: 60,
                    itemCount: controller.numberOfEntries.value,
                    itemBuilder: (context, index) => EmployeeResult(
                      index: index,
                      removeEntries: controller.removeEntries,
                      name: controller.data.value[index]['name']!,
                      id: controller.data.value[index]['id']!,
                      date: controller.data.value[index]['date']!,
                      gender: controller.data.value[index]['gender']!,
                      diseases: controller.data.value[index]['diseases']!,
                      status: controller.data.value[index]['status']!,
                      payment: controller.data.value[index]['payment']!,
                      avt: 'images/person.png',
                      color: index == 0 ? Colors.blueGrey[50]! : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  const StatisticCard(
      {super.key,
      required this.image,
      required this.title,
      required this.statistic});
  final Widget image;
  final String title;
  final String statistic;

  @override
  Widget build(BuildContext context) {
    return CardCustom(
        child: Row(
      children: [
        image,
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.blueGrey[400], fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              statistic,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ));
  }
}

class CardCustom extends StatelessWidget {
  const CardCustom({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: Colors.blueGrey[300]!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
