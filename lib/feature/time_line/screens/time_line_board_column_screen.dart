import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/time_line/widgets/task_item_card.dart';

import '../../../constants/app_color.dart';
import '../widgets/header_field.dart';

DateTime timeCheck = DateTime(2022, 11, 21, 0, 0, 0);

class TimeLineColumnScreen extends StatelessWidget {
  TimeLineColumnScreen({super.key});
  RxList<Map<String, dynamic>> listTaskCard = [
    {
      'mainTitle': "Design UX research for landing  page",
      'date': timeCheck.add(const Duration(days: 2)),
      'dude': timeCheck.add(const Duration(days: 3)),
      'image': 'assets/images/person.png',
      'check': false.obs,
    },
    {
      'mainTitle': "Start UI design once UX done1",
      'date': timeCheck.add(const Duration(days: 4)),
      'dude': timeCheck.add(const Duration(days: 5)),
      'image': 'assets/images/person.png',
      'check': true.obs,
    },
    {
      'mainTitle': "Start UI design once UX done",
      'date': timeCheck.add(const Duration(hours: 0)),
      'dude': timeCheck.add(const Duration(days: 3, hours: 10)),
      'image': 'assets/images/person.png',
      'check': false.obs,
    },
  ].obs;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeaderField(),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const HeaderOfColumn(
                          icon: Icons.task,
                          title: 'New Tasks (5)',
                        ),
                        Obx(() => Column(children: [
                              ...listTaskCard.value.map(
                                (a) => TaskItemCardNormal(
                                  checkBox: a['check'].value,
                                  onChange: (value) => a['check'].value = value,
                                  mainTitle: a['mainTitle'],
                                  date: a['date'],
                                  image: a['image'],
                                  due: a['dude'],
                                ),
                              )
                            ]))
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      children: [
                        const HeaderOfColumn(
                          icon: Icons.task,
                          title: 'New Tasks (5)',
                        ),
                        Obx(() => Column(children: [
                              ...listTaskCard.value.map(
                                (a) => TaskItemCardNormal(
                                  checkBox: a['check'].value,
                                  onChange: (value) => a['check'].value = value,
                                  mainTitle: a['mainTitle'],
                                  date: a['date'],
                                  image: a['image'],
                                  due: a['dude'],
                                ),
                              )
                            ]))
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      children: [
                        const HeaderOfColumn(
                          icon: Icons.task,
                          title: 'New Tasks (5)',
                        ),
                        Obx(() => Column(children: [
                              ...listTaskCard.value.map(
                                (a) => TaskItemCardNormal(
                                  checkBox: a['check'].value,
                                  onChange: (value) => a['check'].value = value,
                                  mainTitle: a['mainTitle'],
                                  date: a['date'],
                                  image: a['image'],
                                  due: a['dude'],
                                ),
                              )
                            ]))
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      children: [
                        const HeaderOfColumn(
                          icon: Icons.task,
                          title: 'New Tasks (5)',
                        ),
                        Obx(() => Column(children: [
                              ...listTaskCard.value.map(
                                (a) => TaskItemCardNormal(
                                  checkBox: a['check'].value,
                                  onChange: (value) => a['check'].value = value,
                                  mainTitle: a['mainTitle'],
                                  date: a['date'],
                                  image: a['image'],
                                  due: a['dude'],
                                ),
                              )
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderOfColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  const HeaderOfColumn({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.grey[400]!),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.textColor,
          ),
          Expanded(
              child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          )),
          // const Spacer(),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.add, color: AppColors.textColor),
          ),
          const SizedBox(width: 10.0),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.more_horiz,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
