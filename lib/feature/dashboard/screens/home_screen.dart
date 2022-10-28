import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../constants/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../constants/reponsiveness.dart';

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

class Data {
  final String name;
  final double percents;
  final Color color;
  final String imagePath;
  Data(
      {required this.imagePath,
      required this.name,
      required this.percents,
      required this.color});
}

List<Data> data = [
  Data(
      name: 'Developers',
      percents: (30 / 120 * 100).round().toDouble(),
      color: AppColors.primaryColor,
      imagePath: 'assets/images/work-process.png'),
  Data(
    name: 'Marketing',
    percents: (20 / 120 * 100).round().toDouble(),
    color: Colors.blue,
    imagePath: 'assets/images/to-do-list.png',
  ),
  Data(
    name: 'Finance',
    percents: (30 / 120 * 100).round().toDouble(),
    color: Colors.red,
    imagePath: 'assets/images/checked.png',
  ),
  Data(
    name: 'Designing',
    percents: (40 / 120 * 100).round().toDouble(),
    color: Colors.yellow,
    imagePath: 'assets/images/checked.png',
  ),
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  RxInt touchedIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          const Divider(thickness: 0.2, color: AppColors.textColor),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey),
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
                                      touchCallback: (FlTouchEvent event,
                                          pieTouchResponse) {
                                        if (!event
                                                .isInterestedForInteractions ||
                                            pieTouchResponse == null ||
                                            pieTouchResponse.touchedSection ==
                                                null) {
                                          touchedIndex.value = -1;
                                          return;
                                        }
                                        touchedIndex.value = pieTouchResponse
                                            .touchedSection!
                                            .touchedSectionIndex;
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
                                              titlePositionPercentageOffset:
                                                  0.55,
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
                            Container(
                              width: 300,
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TypeEmployItem(i: 0),
                                      TypeEmployItem(i: 1),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TypeEmployItem(i: 2),
                                      TypeEmployItem(i: 3),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40.0),
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
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class TypeEmployItem extends StatelessWidget {
  final int i;
  const TypeEmployItem({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '50',
          style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Container(width: 15, height: 15, color: data[i].color),
            Text(' ${data[i].name}',
                style:
                    const TextStyle(color: AppColors.textColor, fontSize: 20.0))
          ],
        )
      ],
    );
  }
}

class TopEmployCard extends StatelessWidget {
  final String image;
  final String name;
  final DateTime time;
  final double point;
  const TopEmployCard({
    Key? key,
    required this.image,
    required this.name,
    required this.time,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.textColor.withOpacity(0.6),
                  blurRadius: 10.0),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              ),
              const SizedBox(height: 7.0),
              Text(
                '${time.day}/${time.month}/${time.year}',
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.green),
            color: Colors.green.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            '$point Point',
            style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
        ),
      ],
    );
  }
}

class Card1 extends StatelessWidget {
  final Map<String, dynamic> e;
  const Card1({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
                    ? const Icon(Icons.trending_down_rounded, color: Colors.red)
                    : const Icon(Icons.trending_up_rounded,
                        color: Colors.green),
                Text(
                  e['percent'].toString(),
                  style: TextStyle(
                    color: e['percent'] < 0 ? Colors.red : Colors.green,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Row2Field extends StatelessWidget {
  final List<Widget> childre;
  const Row2Field({super.key, required this.childre});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(children: childre)
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: childre);
  }
}

class FieldAuto extends StatelessWidget {
  final Widget child;
  final int? flex;
  const FieldAuto({super.key, required this.child, this.flex});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(width: double.infinity, child: child),
          )
        : Expanded(flex: flex ?? 1, child: child);
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

class ColumnChartTwoColumnCustom extends StatefulWidget {
  ColumnChartTwoColumnCustom({
    Key? key,
    required this.barGroups,
    required this.columnData,
    required this.members,
  }) : super(key: key);

  final List<BarChartGroupData> barGroups;
  final int columnData;
  final List<String> members;

  @override
  State<StatefulWidget> createState() => ColumnChartTwoColumnCustomState();
}

class ColumnChartTwoColumnCustomState
    extends State<ColumnChartTwoColumnCustom> {
  final Color leftBarColor = AppColors.primaryColor;
  final Color rightBarColor = AppColors.primaryColor;
  final double width = 20;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final items = widget.barGroups;

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BarChart(
          swapAnimationDuration: const Duration(milliseconds: 250),
          BarChartData(
            maxY: 20,
            barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.grey,
                  getTooltipItem: (_a, _b, _c, _d) => null,
                ),
                touchCallback: (FlTouchEvent event, response) {
                  if (response == null || response.spot == null) {
                    setState(() {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    });
                    return;
                  }

                  touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                  setState(() {
                    if (!event.isInterestedForInteractions) {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                      return;
                    }
                    showingBarGroups = List.of(rawBarGroups);
                    if (touchedGroupIndex != -1) {
                      var sum = 0.0;
                      for (var rod
                          in showingBarGroups[touchedGroupIndex].barRods) {
                        sum += rod.toY;
                      }
                      final avg = sum /
                          showingBarGroups[touchedGroupIndex].barRods.length;

                      showingBarGroups[touchedGroupIndex] =
                          showingBarGroups[touchedGroupIndex].copyWith(
                        barRods: showingBarGroups[touchedGroupIndex]
                            .barRods
                            .map((rod) {
                          return rod.copyWith(toY: avg);
                        }).toList(),
                      );
                    }
                  });
                }),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 42,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: 1,
                  getTitlesWidget: leftTitles,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: widget.barGroups,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '${(widget.columnData / 2).round()} ';
    } else if (value == 19) {
      text = '${(widget.columnData).round()} ';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = widget.members;

    Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: leftBarColor,
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        color: rightBarColor,
        width: width,
      ),
    ]);
  }
}
