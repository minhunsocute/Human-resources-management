import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';

import '../../../constants/app_color.dart';
import '../../../constants/utils.dart';
import '../../../widgets/column_2_chart.dart';
import '../../../widgets/line_chart.dart';
import '../../dashboard/widgets/field_auto.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/button_icon.dart';
import '../widgets/current_activity_item.dart';
import '../widgets/header_list_item.dart';

List<Widget> tableMedicalHistory = [
  const HeaderListItem(
    titles: ["ID", "Medical", "Doctor", "Clinic Room", "Date", "Status"],
    checkHeader: true,
  ),
  const SizedBox(height: 10.0),
  Expanded(
    child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        ...fakeDataMedicalHistory.map(
          (e) => ListItem(
            checkHeader: true,
            widgets: [
              Text(
                e["id"].toString(),
                style: const TextStyle(
                  color: AppColors.primarySecondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              Text(
                e["Medical"].toString(),
                style: const TextStyle(
                  color: AppColors.primarySecondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              Text(
                e["Doctor"].toString(),
                style: const TextStyle(
                  color: AppColors.primarySecondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              Text(
                e["cr"].toString(),
                style: const TextStyle(
                  color: AppColors.primarySecondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              Text(
                DateFormat().add_yMd().format(e["date"]),
                style: const TextStyle(
                  color: AppColors.primarySecondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: e["status"] == 0
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      e["status"] == 0 ? "Completed" : "Uncompleted",
                      style: TextStyle(
                        color: e["status"] == 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
];

List<Map<String, dynamic>> fakeDataMedicalHistory = [
  {
    "id": 0,
    "Medical": "Covid 19",
    "Doctor": "Nguyen Minh Hung",
    "cr": "Phong Kham da khoa so 1",
    "date": DateTime.now(),
    "status": 0,
  },
  {
    "id": 1,
    "Medical": "Toothdath",
    "Doctor": "Truong Huynh Duc Hoang",
    "cr": "Phong Kham da khoa so 1",
    "date": DateTime.now(),
    "status": 1,
  },
  {
    "id": 2,
    "Medical": "Headath",
    "Doctor": "Nguyen Trung Hieu",
    "cr": "Phong Kham da khoa so 1",
    "date": DateTime.now(),
    "status": 0,
  },
];

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Training Progress Tracking',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Text(
                              'Love what you are learning to do',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            ),
                            const SizedBox(width: 40.0),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                              child: Row2Field(children: [
                                FieldAuto(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Activity Hours',
                                        style: TextStyle(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                      SizedBox(
                                        height: 300,
                                        width: double.infinity,
                                        child: ColumnChartTwoColumnCustom(
                                          barGroups: [
                                            makeGroupData(0, 150 / 300 * 20,
                                                60 / 300 * 20),
                                            makeGroupData(1, 180 / 300 * 20,
                                                70 / 300 * 20),
                                            makeGroupData(2, 80 / 300 * 20,
                                                50 / 300 * 20),
                                            makeGroupData(3, 230 / 300 * 20,
                                                210 / 300 * 20),
                                            makeGroupData(4, 100 / 300 * 20,
                                                80 / 300 * 20),
                                            makeGroupData(5, 100 / 300 * 20,
                                                30 / 300 * 20),
                                            makeGroupData(6, 200 / 300 * 20,
                                                30 / 300 * 20),
                                          ],
                                          members: Utils.listDaysInWeek,
                                          columnData: 300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Time Spent',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '24h',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'Lessons Taken',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '19',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'Lesson Remaining',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '108',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(height: 50),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Statistic Assignment',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 210,
                                    child: LineChartDesign(
                                      listData: [
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
                                        FlSpot(11, 1.44),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            height: constraints.maxHeight * 0.40,
                            width: constraints.maxWidth * 0.2,
                            child: const CurrentActivity(),
                          ),
                          const SizedBox(height: 50),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey[300]!,
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Skill Improvement',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                const SizedBox(height: 10),
                                Image.asset(
                                  'images/growth.png',
                                  height: 220,
                                  width: 300,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey[300]!,
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20.0),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/person.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey[200]!,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Mr.Minh Hung',
                          style: TextStyle(
                              // color: AppColors.headline1TextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          '22 Years, Male',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Divider(thickness: 0.6),
                        const SizedBox(height: 20.0),
                        const ProfileRow(
                          mainTitle: "Email",
                          title: 'hungnguyen.201102ak@gmail.com',
                        ),
                        const SizedBox(height: 15.0),
                        const ProfileRow(
                          mainTitle: "Phone",
                          title: '(704) 555-0127',
                        ),
                        const SizedBox(height: 15.0),
                        const ProfileRow(
                          mainTitle: "Date of Birth",
                          title: '14 February 2001',
                        ),
                        const SizedBox(height: 15.0),
                        const ProfileRow(
                          mainTitle: "Diseases",
                          title: 'Cardiology',
                        ),
                        const SizedBox(height: 15.0),
                        const Divider(thickness: 0.6),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ContainerProcess(
                                  iconData: Icons.timelapse_outlined,
                                  mainTitle: "Time Spend",
                                  total: 900,
                                  data: 400,
                                  color: Colors.red,
                                  backgroundColor: Colors.red.withOpacity(0.2),
                                  des: "12h",
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: ContainerProcess(
                                  iconData: Icons.percent,
                                  mainTitle: "Current Course Progress",
                                  total: 500,
                                  data: 400,
                                  color: Colors.purple,
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  des: "80%",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ContainerProcess(
                                  iconData: Icons.bookmarks_sharp,
                                  mainTitle: "Course Completed",
                                  total: 10,
                                  data: 5,
                                  color: Colors.orange,
                                  backgroundColor:
                                      Colors.orange.withOpacity(0.2),
                                  des: "5",
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: ContainerProcess(
                                  iconData: Icons.grade,
                                  mainTitle: "Average Score",
                                  total: 10,
                                  data: 8,
                                  color: Colors.blue,
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                  des: "8.5",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CurrentActivity extends StatelessWidget {
  const CurrentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[300]!,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Current Assignment",
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          const SizedBox(height: 10.0),
          const Divider(thickness: 1),
          const SizedBox(height: 10.0),
          CurrentActivityItem(
            title: "Lab 2 : Login - Artificial Intelligence",
            time: DateTime.now(),
            status: 0,
          ),
          CurrentActivityItem(
            title: "Lab 2 : Login - Artificial Intelligence",
            time: DateTime.now(),
            status: 1,
          ),
          CurrentActivityItem(
            title: "Lab 2 : Login - Artificial Intelligence",
            time: DateTime.now(),
            status: 1,
          ),
          CurrentActivityItem(
            title: "Lab 2 : Login - Artificial Intelligence",
            time: DateTime.now(),
            status: 0,
          ),
        ],
      ),
    );
  }
}

class ContainerProcess extends StatelessWidget {
  final String mainTitle;
  final int total;
  final int data;
  final Color color;
  final Color backgroundColor;
  final String des;
  final IconData iconData;
  const ContainerProcess({
    Key? key,
    required this.mainTitle,
    required this.total,
    required this.data,
    required this.color,
    required this.backgroundColor,
    required this.des,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                iconData,
                size: 30,
                color: color,
              ),
              Expanded(
                child: Text(
                  mainTitle,
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          LinearPercentIndicator(
            lineHeight: 5,
            percent: data / total,
            progressColor: color,
            backgroundColor: Colors.white.withOpacity(0.2),
            animation: true,
            animationDuration: 1000,
            barRadius: const Radius.circular(20),
          ),
          const SizedBox(height: 10.0),
          Text(
            des,
            style: TextStyle(
                color: color, fontSize: 20.0, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String mainTitle;
  final String title;
  const ProfileRow({
    Key? key,
    required this.mainTitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
          Text(
            title,
            style: const TextStyle(
                // color: AppColors.headline1TextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final List<Widget> widgets;
  final bool? checkHeader;
  final bool? checkShadow;
  const ListItem(
      {super.key, required this.widgets, this.checkHeader, this.checkShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: checkHeader == null
          ? Row(
              children: [
                ...widgets.map((e) => Expanded(child: e)),
              ],
            )
          : Row(
              children: [
                Expanded(flex: 1, child: widgets[0]),
                for (int i = 1; i < widgets.length; i++)
                  Expanded(flex: 3, child: widgets[i])
              ],
            ),
    );
  }
}
