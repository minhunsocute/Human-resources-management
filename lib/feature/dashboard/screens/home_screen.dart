import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../constants/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../constants/reponsiveness.dart';
import '../../../widgets/column_2_chart.dart';
import '../../../widgets/line_chart.dart';
import '../widgets/card_1.dart';
import '../widgets/field_auto.dart';
import '../widgets/row_field.dart';
import '../widgets/top_employ_card.dart';
import '../widgets/type_employ_item.dart';

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
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  RxInt touchedIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        const SizedBox(height: 20.0),
        ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...listCard1.map((e) => Container(
                        width: double.infinity,
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
        const SizedBox(height: 20.0),
        Row2Field(
          childre: [
            FieldAuto(
              flex: 2,
              child: Container(
                margin: (ResponsiveWidget.isSmallScreen(context))
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(left: 20.0, right: 10.0),
                padding: const EdgeInsets.all(20.0),
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
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.symmetric(horizontal: 10.0),
                // height: 300,
                padding: const EdgeInsets.all(20.0),
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
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
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
                      child: ColumnChartTwoColumnCustom(
                        barGroups: [
                          makeGroupData(0, 150 / 300 * 20, 60 / 300 * 20),
                          makeGroupData(1, 180 / 300 * 20, 70 / 300 * 20),
                          makeGroupData(2, 80 / 300 * 20, 50 / 300 * 20),
                          makeGroupData(3, 230 / 300 * 20, 210 / 300 * 20),
                          makeGroupData(4, 100 / 300 * 20, 80 / 300 * 20),
                          makeGroupData(5, 100 / 300 * 20, 30 / 300 * 20),
                          makeGroupData(6, 200 / 300 * 20, 30 / 300 * 20),
                        ],
                        members: const [
                          'Sun',
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat'
                        ],
                        columnData: 300,
                      ),
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
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 20.0, left: 10.0),
                padding: const EdgeInsets.all(20.0),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
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
        ),
        const SizedBox(height: 20.0),
        Row2Field(
          childre: [
            FieldAuto(
              flex: 6,
              child: Container(
                  margin: (ResponsiveWidget.isSmallScreen(context))
                      ? const EdgeInsets.symmetric(horizontal: 20.0)
                      : const EdgeInsets.only(right: 10.0, left: 20.0),
                  padding: const EdgeInsets.all(20.0),
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
                          'Employees By Department',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 280,
                            width: 280,
                            child: Obx(
                              () => PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex.value = -1;
                                        return;
                                      }
                                      touchedIndex.value = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
                                    },
                                  ),
                                  startDegreeOffset: 180,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 100,
                                  sections: data
                                      .asMap()
                                      .map<int, PieChartSectionData>(
                                          (index, data) {
                                        final isTouched =
                                            index == touchedIndex.value;

                                        return MapEntry(
                                          index,
                                          PieChartSectionData(
                                            color: data.color,
                                            value: data.percents,
                                            title: '',
                                            // borderSide:
                                            //     const BorderSide(style: BorderStyle.solid),
                                            radius: isTouched ? 80 : 60,
                                            titleStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            titlePositionPercentageOffset: 0.55,
                                          ),
                                        );
                                      })
                                      .values
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 60.0),
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TypeEmployItem(i: 0),
                                    TypeEmployItem(i: 1),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TypeEmployItem(i: 2),
                                    TypeEmployItem(i: 3),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  )),
            ),
            FieldAuto(
              flex: 5,
              child: Container(
                margin: (ResponsiveWidget.isSmallScreen(context))
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 20.0, left: 10.0),
                padding: const EdgeInsets.all(20.0),
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
                            'Project Status',
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Year ',
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
                    const SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: LineChartDesign(
                        listData: [
                          FlSpot(0, 3),
                          FlSpot(1, 2),
                          FlSpot(2, 5),
                          FlSpot(3, 3.1),
                          FlSpot(4, 4),
                          FlSpot(5, 3),
                          FlSpot(6, 4),
                          FlSpot(7, 3),
                          FlSpot(8, 2),
                          FlSpot(9, 5),
                          FlSpot(10, 3.1),
                          FlSpot(11, 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Row2Field(
          childre: [
            FieldAuto(
              flex: 3,
              child: Container(
                margin: (ResponsiveWidget.isSmallScreen(context))
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 10.0, left: 20.0),
                padding: const EdgeInsets.all(20.0),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
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
                                  color: Colors.grey,
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
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 20.0, left: 10.0),
                padding: const EdgeInsets.all(20.0),
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
                    TodoItem(
                      title: 'Lorem ipsum is simply dummy text of the printing',
                      time: DateTime.now(),
                      type: 0,
                    ),
                    const Divider(thickness: 1),
                    TodoItem(
                      title: 'Lorem ipsum is=he printing',
                      time: DateTime.now(),
                      type: 1,
                    ),
                    const Divider(thickness: 1),
                    TodoItem(
                      title: 'Lorem ipsum is simply dummy textnting',
                      time: DateTime.now(),
                      type: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.all(20.0),
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
                  'Recruitment Progress',
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
                    child: Text('CANDIDATE NAME',
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
                    child: Text('RECRUITMENT STATUS',
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
              const RecruitmentProgressItem(
                image: 'assets/images/person.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                round: 1,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
              ),
              const Divider(thickness: 1),
              const RecruitmentProgressItem(
                image: 'assets/images/person2.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                round: 1,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
              ),
              const Divider(thickness: 1),
              const RecruitmentProgressItem(
                image: 'assets/images/person1.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                round: 1,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
              ),
              const Divider(thickness: 1),
              const RecruitmentProgressItem(
                image: 'assets/images/person2.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                round: 1,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

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

class TodoItem extends StatelessWidget {
  final String title;
  final DateTime time;
  final int type;
  const TodoItem({
    Key? key,
    required this.title,
    required this.time,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(color: AppColors.textColor, fontSize: 17.0),
              ),
              const SizedBox(height: 3.0),
              Row(
                children: [
                  Text(
                    '${time.day}/${time.month}/${time.year} ',
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: type == 0
                            ? Colors.purple.withOpacity(0.3)
                            : type == 1
                                ? Colors.blue.withOpacity(0.3)
                                : Colors.red.withOpacity(0.3),
                      ),
                      child: Text(
                        type == 0
                            ? 'Dude Tommorrow'
                            : type == 1
                                ? 'Done'
                                : 'Expried',
                        style: TextStyle(
                            color: type == 0
                                ? Colors.purple
                                : type == 1
                                    ? Colors.blue
                                    : Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}

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
