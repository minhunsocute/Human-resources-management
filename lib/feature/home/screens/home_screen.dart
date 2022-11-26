import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/employee/widgets/employee_status_item.dart';
import 'package:ueh_project_admin/feature/employee/widgets/recruitment_progress_item.dart';
import 'package:ueh_project_admin/feature/home/controller/home_controller.dart';
import 'package:ueh_project_admin/feature/home/widgets/card_1.dart';
import 'package:ueh_project_admin/feature/home/widgets/week_calendar.dart';

import '../../../constants/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../constants/reponsiveness.dart';
import '../../../widgets/column_2_chart.dart';
import '../../../widgets/line_chart.dart';
import '../../dashboard/widgets/field_auto.dart';
import '../../dashboard/widgets/row_field.dart';
import '../../employee/widgets/todo_item.dart';
import '../../employee/widgets/top_employ_card.dart';
import '../../employee/widgets/type_employ_item.dart';

List<Map<String, dynamic>> listEmployeeFakeData = [
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Learning',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  },
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Examining',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  },
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Learning',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  },
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Examining',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  }
];

List<List<FlSpot>> fakeTurnOverData = [
  [
    FlSpot(0, 3.44),
    FlSpot(1, 2.44),
    FlSpot(2, 4.44),
    FlSpot(3, 1.44),
    FlSpot(4, 6.44),
    FlSpot(5, 4.44),
    FlSpot(6, 2.44),
    FlSpot(7, 2.7),
    FlSpot(8, 1.6),
    FlSpot(9, 2.65),
    FlSpot(10, 2.84),
    FlSpot(11, 1.44)
  ],
  [
    FlSpot(0, 2.44),
    FlSpot(1, 3.44),
    FlSpot(2, 2.44),
    FlSpot(3, 2.44),
    FlSpot(4, 5.44),
    FlSpot(5, 3.44),
    FlSpot(6, 1.44),
    FlSpot(7, 5.7),
    FlSpot(8, 2.6),
    FlSpot(9, 3.65),
    FlSpot(10, 4.84),
    FlSpot(11, 5.44)
  ]
];

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

List<Map<String, dynamic>> listCard1 = [
  {
    'title': 'Total Employees',
    'data': 352,
    'percent': 20,
  },
  {
    'title': 'Number of Leaves',
    'data': 36,
    'percent': -12,
  },
  {
    'title': 'New Employees',
    'data': 124,
    'percent': 30,
  },
  {
    'title': 'Happines Rate',
    'data': 352,
    'percent': -24,
  },
  {
    'title': 'Purchase',
    'data': '\$32,431',
    'percent': 12,
  },
  {
    'title': 'Return',
    'data': '\$28,838',
    'percent': -12,
  }
];

List<Map<String, dynamic>> listTodoFakeData = [
  {
    'title': 'Lorem ipsum is simply dummy text of the printing',
    'time': DateTime.now(),
    'type': 0,
  },
  {
    'title': 'Lorem ipsum is=he printing',
    'time': DateTime.now(),
    'type': 1,
  },
  {
    'title': 'Lorem ipsum is simply dummy textnting',
    'time': DateTime.now(),
    'type': 2,
  },
];

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  RxInt touchedIndex = (-1).obs;

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  children: [
                    ...listCard1.map((e) => Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.textColor.withOpacity(0.04),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['title'],
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Text(
                                    e['data'].toString(),
                                    style: const TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  e['percent'] < 0
                                      ? const Icon(Icons.trending_down_rounded,
                                          color: Colors.red)
                                      : const Icon(Icons.trending_up_rounded,
                                          color: Colors.green),
                                  Text(
                                    e['percent'].toString(),
                                    style: TextStyle(
                                      color: e['percent'] < 0
                                          ? Colors.red
                                          : Colors.green,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      ...listCard1.map((e) => Card1(e: e)),
                    ],
                  ),
                ),

          const SizedBox(height: 10.0),
          ////////////////////////////////////////////////////////////////
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.only(left: 15.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 10.0,
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Turnover",
                      style: TextStyle(
                          // color: AppColors.headline1TextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    InkWell(
                      onTap: () {
                        homeController.currentChart = "Turnover";
                        Get.dialog(
                          SizedBox(
                              height: Get.height * 0.5,
                              width: Get.width * 0.5,
                              child: WeekCalendar()),
                        );
                      },
                      child: Row(
                        children: const [
                          Text("Week ",
                              style: TextStyle(
                                  color: AppColors.primarySecondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                          Icon(Icons.arrow_drop_down,
                              color: AppColors.primarySecondColor),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: Obx(() => LineChartDesign(
                        listData: fakeTurnOverData
                            .elementAt(homeController.flagChange.value),
                      )),
                )
              ],
            ),
          ),
          ////////////////////////////////////////////////////////////////
          const SizedBox(height: 20.0),
          Row2FieldWidget(),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          Row4FieldWidget(),
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            margin: Utils.edgeInsetsHorizontal20,
            padding: Utils.edgeInsetsAll20,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.04),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Learning Progress',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Text('EMPLOYEE NAME',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('EMAIL ADDRESS',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('CONTACT NUMBER',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('JOB TITLE',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('STATUS',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Divider(thickness: 1),
                const SizedBox(height: 10.0),
                ...[
                  for (var item in listEmployeeFakeData) ...[
                    RecruitmentProgressItem(
                      image: item['image'],
                      name: item['name'],
                      type: item['type'],
                      status: item['status'],
                      email: item['email'],
                      phoneNumber: item['phoneNumber'],
                    ),
                    const Divider(thickness: 1),
                  ]
                ],
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
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

class Row4FieldWidget extends StatelessWidget {
  Row4FieldWidget({super.key});

  final _animatedListKey = GlobalKey<AnimatedListState>();

  void deleteItem(int index) {
    _animatedListKey.currentState!.removeItem(
      index,
      (context, animation) => TodoItem(
        animation: animation.drive(
          Tween(begin: const Offset(-1, 0), end: const Offset(0, 0)),
        ),
        title: listTodoFakeData[index]['title'],
        time: listTodoFakeData[index]['time'],
        type: listTodoFakeData[index]['type'],
        checkItem: () {
          deleteItem(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row2Field(
      children: [
        FieldAuto(
          flex: 3,
          child: Container(
            margin: (ResponsiveWidget.isSmallScreen(context))
                ? Utils.edgeInsetsHorizontal20
                : const EdgeInsets.only(right: 10.0, left: 20.0),
            padding: Utils.edgeInsetsAll20,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.04),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Employee Status',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(5.0),
                      onTap: () {},
                      child: Container(
                        padding: Utils.edgeInsetsHor10Ver5,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'All ',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Text('EMPLOYEE NAME',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('EMPLOYEE ADDRESS',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('HOME OFFICE',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('STATUS',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Divider(thickness: 1),
                const SizedBox(height: 10.0),
                const EmployeeStatusItem(
                  image: 'assets/images/person1.png',
                  name: 'Nguyen Minh Hung',
                  type: 'Fullstack Developer',
                  status: 0,
                  email: 'hungnguyen.201102ak@gmail.com',
                ),
                const Divider(thickness: 1),
                const EmployeeStatusItem(
                  image: 'assets/images/person.png',
                  name: 'Truong Huynh Duc hoang',
                  type: 'Backend Developer',
                  status: 1,
                  email: 'hoang.201102ak@gmail.com',
                ),
                const Divider(thickness: 1),
                const EmployeeStatusItem(
                  image: 'assets/images/person2.png',
                  name: 'Nguyen Trung Hieu',
                  type: 'Designer',
                  status: 0,
                  email: 'hieu.201102ak@gmail.com',
                ),
              ],
            ),
          ),
        ),
        FieldAuto(
          flex: 2,
          child: Container(
            margin: (ResponsiveWidget.isSmallScreen(context))
                ? Utils.edgeInsetsHorizontal20
                : Utils.edgeInsetsRight20Left20,
            padding: Utils.edgeInsetsAll20,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.04),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Todo List',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.add_circle,
                          color: Colors.blue, size: 30.0),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: Get.height * 0.2,
                  child: AnimatedList(
                    key: _animatedListKey,
                    itemBuilder: (context, index, animation) {
                      return TodoItem(
                        checkItem: () => deleteItem(index),
                        animation: animation.drive(
                          Tween(begin: Offset.zero, end: Offset.zero),
                        ),
                        title: listTodoFakeData[index]['title'],
                        time: listTodoFakeData[index]['time'],
                        type: listTodoFakeData[index]['type'],
                      );
                    },
                    initialItemCount: listTodoFakeData.length,
                  ),
                ),
                const SizedBox(height: 10),
                TodoItemInput(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TodoItemInput extends StatelessWidget {
  const TodoItemInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.blueGrey[300]!,
            width: 0.3,
          ),
        ),
        hintText: 'Try typing \' Submit Report by Friday 3pm\'',
        hintStyle: TextStyle(
          color: Colors.blueGrey[200],
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        prefixIcon: const Icon(
          Icons.circle_outlined,
          color: Colors.blueGrey,
        ),
        suffixIcon: InkWell(
          onTap: () {
            Get.dialog(
              DatePickerDialog(
                initialDate: DateTime.now(),
                firstDate: DateTime(2022, 1, 1),
                lastDate: DateTime(2022, 12, 30),
              ),
            );
          },
          child: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}

class Row2FieldWidget extends StatelessWidget {
  Row2FieldWidget({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row2Field(
      children: [
        FieldAuto(
          flex: 2,
          child: Container(
            margin: (ResponsiveWidget.isSmallScreen(context))
                ? Utils.edgeInsetsHorizontal20
                : const EdgeInsets.only(left: 20.0, right: 10.0),
            padding: Utils.edgeInsetsAll20,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.04),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Working Format',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                CircularPercentIndicator(
                  animation: true,
                  center: const Text(
                    '30',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  animationDuration: 600,
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: ResponsiveWidget.isSmallScreen(context)
                      ? Get.width / 3
                      : Get.width / 15,
                  lineWidth:
                      ResponsiveWidget.isSmallScreen(context) ? 30 : 17.0,
                  percent: 0.8,
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  progressColor: Colors.blue,
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ),
                    const Text(
                      ' Remote',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    const Text(
                      ' On-Sites',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        FieldAuto(
          flex: 3,
          child: Container(
            margin: (ResponsiveWidget.isSmallScreen(context))
                ? Utils.edgeInsetsHorizontal20
                : const EdgeInsets.symmetric(horizontal: 10.0),
            // height: 300,
            padding: Utils.edgeInsetsAll20,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.04),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Project Employment',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(5.0),
                      onTap: () {
                        homeController.currentChart = "Project Employment";
                        Get.dialog(
                          SizedBox(
                              height: Get.height * 0.5,
                              width: Get.width * 0.5,
                              child: WeekCalendar()),
                        );
                      },
                      child: Container(
                        padding: Utils.edgeInsetsHor10Ver5,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Week ',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Obx(() => ColumnChartTwoColumnCustom(
                        barGroups: fakeProjectEmploymentData[
                            homeController.flagChange1.value],
                        members: Utils.listDaysInWeek,
                        columnData: 300,
                      )),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff53fdd7),
                      ),
                    ),
                    const Text(
                      ' Completed',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // const Spacer(),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffff5182),
                      ),
                    ),
                    const Text(
                      ' Uncompleted',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        FieldAuto(
          flex: 3,
          child: Container(
            margin: (ResponsiveWidget.isSmallScreen(context))
                ? Utils.edgeInsetsHorizontal20
                : Utils.edgeInsetsRight20Left20,
            padding: Utils.edgeInsetsAll20,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.04),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Top Employment',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(5.0),
                      onTap: () {},
                      child: Container(
                        padding: Utils.edgeInsetsHor10Ver5,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Swap ',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.swap_vert, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                TopEmployCard(
                  name: 'Allen Walker',
                  point: 9.9,
                  image: 'assets/images/person.png',
                  time: DateTime.now(),
                ),
                const SizedBox(height: 10.0),
                const Divider(thickness: 0.8),
                const SizedBox(height: 10.0),
                TopEmployCard(
                  name: 'Nguyen Minh Hung',
                  point: 9.2,
                  image: 'assets/images/person1.png',
                  time: DateTime.now(),
                ),
                const SizedBox(height: 10.0),
                const Divider(thickness: 0.8),
                const SizedBox(height: 10.0),
                TopEmployCard(
                  name: 'Cristiano Ronaldo',
                  point: 9.0,
                  image: 'assets/images/person2.png',
                  time: DateTime.now(),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
