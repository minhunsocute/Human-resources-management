import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/feature/employee/widgets/button_icon.dart';
import 'package:ueh_project_admin/feature/task_project/screens/create_project_screen.dart';
import 'package:ueh_project_admin/feature/task_project/screens/view_project_screen.dart';

import '../../../constants/app_color.dart';
import '../../../constants/utils.dart';
import '../../../widgets/column_2_chart.dart';
import '../../../widgets/custom_button.dart';
import '../../home/controller/home_controller.dart';
import '../../home/widgets/week_calendar.dart';

List<List<BarChartGroupData>> fakeProjectEmploymentData = [
  [
    makeGroupData(0, 150 / 300 * 20, 60 / 300 * 20),
    makeGroupData(1, 180 / 300 * 20, 70 / 300 * 20),
    makeGroupData(2, 80 / 300 * 20, 50 / 300 * 20),
    makeGroupData(3, 230 / 300 * 20, 210 / 300 * 20),
    makeGroupData(4, 100 / 300 * 20, 80 / 300 * 20),
    makeGroupData(5, 100 / 300 * 20, 30 / 300 * 20),
    makeGroupData(6, 200 / 300 * 20, 30 / 300 * 20),
  ],
  [
    makeGroupData(0, 200 / 300 * 20, 30 / 300 * 20),
    makeGroupData(1, 180 / 300 * 20, 70 / 300 * 20),
    makeGroupData(2, 150 / 300 * 20, 60 / 300 * 20),
    makeGroupData(3, 230 / 300 * 20, 210 / 300 * 20),
    makeGroupData(4, 80 / 300 * 20, 50 / 300 * 20),
    makeGroupData(5, 100 / 300 * 20, 80 / 300 * 20),
    makeGroupData(6, 100 / 300 * 20, 30 / 300 * 20),
  ]
];

List<List<Widget>> fakeTaskToday = [
  [
    TaskItem(
      taskName: 'UI/UX Design',
      imagePic: 'assets/images/person.png',
      name: 'Minh Hung',
      type: 0,
      time: DateTime.now(),
    ),
    const Divider(thickness: 1),
    TaskItem(
      taskName: 'Front End',
      imagePic: 'assets/images/person1.png',
      name: 'Duc Hoang',
      type: 1,
      time: DateTime.now(),
    ),
    const Divider(thickness: 1),
    TaskItem(
      taskName: 'Backend',
      imagePic: 'assets/images/person2.png',
      name: 'Trung Hieu',
      type: 1,
      time: DateTime.now(),
    ),
    const Divider(thickness: 1),
    TaskItem(
      taskName: 'Figma',
      imagePic: 'assets/images/person.png',
      name: 'Minh Hung',
      type: 0,
      time: DateTime.now(),
    ),
  ],
  [
    TaskItem(
      taskName: 'Front End',
      imagePic: 'assets/images/person1.png',
      name: 'Duc Hoang',
      type: 1,
      time: DateTime.now(),
    ),
    const Divider(thickness: 1),
    TaskItem(
      taskName: 'UI/UX Design',
      imagePic: 'assets/images/person.png',
      name: 'Minh Hung',
      type: 1,
      time: DateTime.now(),
    ),
    const Divider(thickness: 1),
    TaskItem(
      taskName: 'Figma',
      imagePic: 'assets/images/person.png',
      name: 'Minh Hung',
      type: 1,
      time: DateTime.now(),
    ),
    const Divider(thickness: 1),
    TaskItem(
      taskName: 'Backend',
      imagePic: 'assets/images/person2.png',
      name: 'Trung Hieu',
      type: 0,
      time: DateTime.now(),
    ),
  ]
];

// ignore: must_be_immutable
class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  RxInt checkPage = 0.obs;
  final homeController = Get.find<HomeController>();

  var flag = 0.obs;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() => checkPage.value == 0
          ? Column(
              children: [
                const SizedBox(height: 20.0),
                Row2Field(
                  children: [
                    FieldAuto(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: AppColors.backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.textColor.withOpacity(0.2),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Row(
                              children: [
                                const Text(
                                  'List Project',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                const SizedBox(width: 20.0),
                                const Text(
                                  'Search',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(child: TextFormField()),
                                IconButton(
                                  onPressed: () => Get.to(() =>
                                      Material(child: CreateProjectScreen())),
                                  icon:
                                      const Icon(Icons.add, color: Colors.blue),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40.0),
                            Row(
                              children: const [
                                Expanded(
                                  flex: 1,
                                  child: Text('PROJECT NAME',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text('TIME START -> DEADLINE',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('PROGRESS',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('TASK',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('MEMBER',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(flex: 1, child: Text('')),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            const Divider(thickness: 1),
                            const SizedBox(height: 10.0),
                            ProjectItem(
                                title: 'Manuel Project',
                                startTime: DateTime.now(),
                                deadTime: DateTime.now(),
                                percent: 0.7,
                                func: () => Get.to(() => Scaffold(
                                      body: SingleChildScrollView(
                                        child: ViewProjectScreen(
                                          backFunc: () {
                                            checkPage.value = 0;
                                          },
                                        ),
                                      ),
                                    )),
                                tasks: 20),
                            const Divider(thickness: 1),
                            ProjectItem(
                                title: 'Coding Project',
                                startTime: DateTime.now(),
                                deadTime: DateTime.now(),
                                func: () {
                                  Get.to(() => Scaffold(
                                        body: SingleChildScrollView(
                                          child: ViewProjectScreen(
                                            backFunc: () {
                                              checkPage.value = 0;
                                            },
                                          ),
                                        ),
                                      ));
                                },
                                percent: 0.2,
                                tasks: 20),
                            const Divider(thickness: 1),
                            ProjectItem(
                                title: 'Lala Project',
                                startTime: DateTime.now(),
                                deadTime: DateTime.now(),
                                func: () {
                                  Get.to(() => Scaffold(
                                        body: SingleChildScrollView(
                                          child: ViewProjectScreen(
                                            backFunc: () {
                                              checkPage.value = 0;
                                            },
                                          ),
                                        ),
                                      ));
                                },
                                percent: 0.7,
                                tasks: 20),
                            const Divider(thickness: 1),
                            ProjectItem(
                                title: 'Pro Project',
                                startTime: DateTime.now(),
                                deadTime: DateTime.now(),
                                func: () {
                                  Get.to(() => Scaffold(
                                        body: SingleChildScrollView(
                                          child: ViewProjectScreen(
                                            backFunc: () {
                                              checkPage.value = 0;
                                            },
                                          ),
                                        ),
                                      ));
                                },
                                percent: 0.1,
                                tasks: 20),
                          ]),
                        )),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textColor.withOpacity(0.2),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Row2Field(
                    children: [
                      FieldAuto(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Chart Task',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                ButtonIcon(
                                    title: 'Select Week',
                                    press: () {
                                      homeController.currentChart =
                                          "Project Employment";
                                      Get.dialog(
                                        SizedBox(
                                            height: Get.height * 0.5,
                                            width: Get.width * 0.5,
                                            child: WeekCalendar()),
                                      );
                                    },
                                    icon: Icons.calendar_month,
                                    color1: AppColors.primaryColor,
                                    color2:
                                        AppColors.primaryColor.withOpacity(0.3))
                              ],
                            ),
                            SizedBox(
                              height: 420,
                              width: double.infinity,
                              child: ColumnChartTwoColumnCustom(
                                barGroups: fakeProjectEmploymentData[
                                    homeController.flagChange1.value],
                                members: Utils.listDaysInWeek,
                                columnData: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Obx(() => FieldAuto(
                              child: SizedBox(
                                  child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Task today',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  ButtonIcon(
                                      title: 'Completed',
                                      press: () {
                                        flag.value = (flag.value - 1).abs();
                                      },
                                      icon: Icons.change_circle_outlined,
                                      color1: AppColors.primaryColor,
                                      color2: AppColors.primaryColor
                                          .withOpacity(0.3))
                                ],
                              ),
                              const SizedBox(height: 30.0),
                              const SizedBox(height: 10.0),
                              Row(
                                children: const [
                                  Expanded(
                                    flex: 1,
                                    child: Text('TASK NAME',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text('USER',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text('DEAD TIME',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text('EXPANDED',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              const Divider(thickness: 1),
                              const SizedBox(height: 10.0),
                              ...fakeTaskToday[flag.value],
                            ],
                          ))))
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
              ],
            )
          : ViewProjectScreen(
              backFunc: () {
                checkPage.value = 0;
              },
            )),
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      color: const Color(0xff53fdd7),
      width: 7,
    ),
    BarChartRodData(
      toY: y2,
      color: const Color(0xffff5182),
      width: 7,
    ),
  ]);
}

class TaskItem extends StatelessWidget {
  final String taskName;
  final String imagePic;
  final String name;
  final DateTime time;
  final int type;
  const TaskItem({
    Key? key,
    required this.taskName,
    required this.imagePic,
    required this.name,
    required this.time,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              taskName,
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imagePic)),
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
            child: Row(
              children: [
                const Icon(Icons.timelapse, color: Colors.red),
                Text(
                  ' ${time.hour}:${time.minute}',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: type == 0
                          ? Colors.green.withOpacity(0.3)
                          : Colors.red.withOpacity(0.3),
                    ),
                    child: Text(
                      type == 0 ? 'Completed' : 'UnCompleted',
                      style: TextStyle(
                          color: type == 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final DateTime startTime;
  final DateTime deadTime;
  final double percent;
  final int tasks;
  final Function() func;
  const ProjectItem({
    Key? key,
    required this.title,
    required this.startTime,
    required this.deadTime,
    required this.percent,
    required this.tasks,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const Icon(Icons.calendar_month,
                    size: 16.0, color: Colors.grey),
                Text('${startTime.day}/${startTime.month}/${startTime.year}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
                const SizedBox(width: 15.0),
                const Text('-',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
                const SizedBox(width: 15.0),
                const Icon(Icons.calendar_month,
                    size: 16.0, color: AppColors.primaryColor),
                Text('${deadTime.day}/${deadTime.month}/${deadTime.year}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
              ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: LinearPercentIndicator(
              percent: percent,
              backgroundColor: Colors.grey.withOpacity(0.2),
              progressColor: percent > 0.6
                  ? Colors.green.withOpacity(0.8)
                  : Colors.red.withOpacity(0.8),
              lineHeight: 8,
              // ignore: deprecated_member_use
              barRadius: const Radius.circular(20.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$tasks task ',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const ImgeItem(image: 'assets/images/person.png'),
                  const SizedBox(width: 5.0),
                  const ImgeItem(image: 'assets/images/person1.png'),
                  const SizedBox(width: 5.0),
                  const ImgeItem(image: 'assets/images/person2.png'),
                  const SizedBox(width: 5.0),
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: AppColors.textColor.withOpacity(0.3),
                        )
                      ],
                    ),
                    child: const Text(
                      '+4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: CustomButton(
                        text: 'View',
                        onTap: func,
                        backgroundColor: Colors.blue.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ImgeItem extends StatelessWidget {
  final String image;
  const ImgeItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
