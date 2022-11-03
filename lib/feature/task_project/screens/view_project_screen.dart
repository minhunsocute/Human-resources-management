import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/feature/home/screens/home_screen.dart';

import '../../../constants/app_color.dart';
import '../../../constants/utils.dart';
import '../../../widgets/column_2_chart.dart';

List<Map<String, dynamic>> fakeDataCommit = [
  {
    'time': DateTime.now().subtract(const Duration(days: 8)),
    'commit': 2,
  },
  {
    'time': DateTime.now().subtract(const Duration(days: 7)),
    'commit': 2,
  },
  {
    'time': DateTime.now(),
    'commit': 2,
  },
  {
    'time': DateTime.now().subtract(const Duration(days: 2)),
    'commit': 2,
  },
  {
    'time': DateTime.now().add(const Duration(days: 20)),
    'commit': 2,
  },
  {
    'time': DateTime.now().add(const Duration(days: 1)),
    'commit': 15,
  },
  {
    'time': DateTime.now().add(const Duration(days: 2)),
    'commit': 6,
  },
  {
    'time': DateTime.now().add(const Duration(days: 3)),
    'commit': 7,
  },
  {
    'time': DateTime.now().add(const Duration(days: 4)),
    'commit': 3,
  },
  {
    'time': DateTime.now().add(const Duration(days: 5)),
    'commit': 4,
  },
  {
    'time': DateTime.now().add(const Duration(days: 6)),
    'commit': 10,
  },
  {
    'time': DateTime.now().add(const Duration(days: 88)),
    'commit': 18,
  }
];

class ViewProjectScreen extends StatelessWidget {
  final Function() backFunc;
  const ViewProjectScreen({super.key, required this.backFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: AppColors.textColor.withOpacity(0.2),
            //     blurRadius: 10.0,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Clinical Management Project',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "In Progress",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Divider(thickness: 1),
              const SizedBox(height: 10.0),
              Row(
                children: const [
                  Text(
                    'Members: ',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  ImgeItem(image: 'assets/images/person.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person1.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person2.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person1.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person2.png'),
                  SizedBox(width: 5.0),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Start Time, Dead time:',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Icon(Icons.calendar_month,
                      size: 16.0, color: Colors.grey),
                  Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
                  Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                ],
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Description',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sollicitudin, urna a mollis imperdiet, tellus nisi euismod turpis, eget mollis diam ligula quis sem. Fusce volutpat nisl vitae nulla aliquet dapibus. Vestibulum quis libero gravida, pellentesque nisi id, malesuada leo. Duis sodales fringilla erat, ut tempus sapien accumsan sed. Vestibulum eu risus eget ligula tincidunt volutpat et non odio. Donec vel facilisis neque. Integer interdum suscipit risus. Suspendisse sodales nisl vel tortor euismod vulputate. Ut a est tincidunt, posuere massa non, dictum odio.',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: AppColors.textColor.withOpacity(0.2),
            //     blurRadius: 10.0,
            //   ),
            // ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Members and Commit',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row2Field(
                childre: [
                  FieldAuto(
                    flex: 1,
                    child: SizedBox(
                      height: 300.0,
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
                        members: Utils.listDaysInWeek,
                        columnData: 300,
                      ),
                    ),
                  ),
                  FieldAuto(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          children: const [
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
                              child: Text('Completed',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Uncompleted',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        const Divider(thickness: 1),
                        const TaskDataItem(
                          image: 'assets/images/person.png',
                          name: "Nguyen Minh Hung",
                          taskCompleted: 30,
                          taskUncomleted: 15,
                        ),
                        const TaskDataItem(
                          image: 'assets/images/person2.png',
                          name: "Truong Huynh Duc Hoang ",
                          taskCompleted: 30,
                          taskUncomleted: 15,
                        ),
                        const TaskDataItem(
                          image: 'assets/images/person1.png',
                          name: "Nguyen Minh Hung",
                          taskCompleted: 30,
                          taskUncomleted: 15,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: AppColors.textColor.withOpacity(0.2),
            //     blurRadius: 10.0,
            //   ),
            // ],
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'AllTask and Commitboard',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row2Field(
              childre: [
                FieldAuto(
                    child: Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: GitHubCalenderBuit(
                            fakeDataCommit: fakeDataCommit))),
                FieldAuto(
                    child: SizedBox(
                        child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: contributionAcitvityField(DateTime.now()),
                    ),
                  ],
                )))
              ],
            )
          ]),
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }

  Widget contributionAcitvityField(DateTime time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${DateFormat().add_MMM().format(time)} ${time.year} ',
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            Expanded(
              child: Container(height: 0.5, color: AppColors.textColor),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 2,
                  height: 10,
                  color: AppColors.textColor.withOpacity(0.5),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.textColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.publish,
                    color: AppColors.textColor.withOpacity(0.5),
                    size: 12,
                  ),
                ),
                Container(
                  width: 2,
                  height: 5,
                  color: AppColors.textColor.withOpacity(0.5),
                )
              ],
            ),
            const SizedBox(width: 10),
            const Text(
              'Created 1 commit in 1 repository',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.more_vert, color: AppColors.textColor),
            ),
          ],
        ),
        for (int i = 0; i < 2; i++)
          SizedBox(
            // color: Colors.red,
            height: 50,
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 2,
                  height: 50,
                  margin: const EdgeInsets.only(left: 9),
                  color: AppColors.textColor.withOpacity(0.5),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 190,
                          child: Text(
                            'minhunsocute/GHealth',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // const Spacer(),
                        SizedBox(
                          width: 200,
                          height: 7,
                          child: LinearPercentIndicator(
                            lineHeight: 10,
                            percent: 0.4,
                            progressColor: Colors.green.withOpacity(0.8),
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            animation: true,
                            animationDuration: 1000,
                            barRadius: const Radius.circular(20),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '155 commits',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Expanded(
              child: Container(height: 0.5, color: AppColors.textColor),
            ),
          ],
        ),
      ],
    );
  }
}

class TaskDataItem extends StatelessWidget {
  final String image;
  final String name;
  final int taskCompleted;
  final int taskUncomleted;
  const TaskDataItem({
    Key? key,
    required this.image,
    required this.name,
    required this.taskCompleted,
    required this.taskUncomleted,
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
              '$taskCompleted Task',
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$taskUncomleted Task',
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
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
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: AppColors.textColor.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}

class GitHubCalenderBuit extends StatefulWidget {
  final List<Map<String, dynamic>> fakeDataCommit;
  const GitHubCalenderBuit({super.key, required this.fakeDataCommit});

  @override
  State<GitHubCalenderBuit> createState() => _GitHubCalenderBuitState();
}

class _GitHubCalenderBuitState extends State<GitHubCalenderBuit> {
  List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int checkConstainInList(DateTime time) {
    for (var item in widget.fakeDataCommit) {
      if (time.day == item['time'].day &&
          time.month == item['time'].month &&
          time.year == item['time'].year) {
        return item['commit'];
      }
    }
    return -1;
  }

  List<DateTime> listDateTime = [
    for (int i = 0; i < 200; i++)
      DateTime.now().subtract(const Duration(days: 10)).add(Duration(days: i))
  ];
  int get maxList => widget.fakeDataCommit
      .fold<int>(0, (max, e) => e['commit'] > max ? e['commit'] : max);
  int getStart() {
    int count = 0;
    for (var item in listDateTime) {
      if (item.weekday != 1) {
        count++;
      } else {
        break;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 140,
            child: Column(
              children: [
                ...weekDays.map(
                  (e) => Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: middleGithubField(getStart(), maxList),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> middleGithubField(int middleData, int maxOfList) {
    int middle = ((listDateTime.length - middleData) / 7).floor();

    return [
      Column(
        children: [
          for (int i = 1; i <= 7; i++) startContainerGit(i, maxOfList),
        ],
      ),
      for (int i = 0; i < middle; i++)
        Column(
          children: [
            for (int j = 0; j < 7; j++)
              middleContainerGIt(middleData, i, j, maxOfList),
          ],
        ),
      Column(
        children: [
          for (int i = 0;
              i <
                  (listDateTime.length - middleData) -
                      ((listDateTime.length - middleData) / 7).floor() * 7;
              i++)
            endContainerGit(middle, i, middleData, maxOfList),
        ],
      )
    ];
  }

  Expanded startContainerGit(int i, int maxList) {
    int check = 0;
    if (i >= listDateTime[0].weekday) {
      check = checkConstainInList(listDateTime[i - listDateTime[0].weekday]);
    }
    return Expanded(
      child: Container(
        height: 15,
        width: 15,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: (i >= listDateTime[0].weekday)
              ? (check > 0)
                  ? Colors.green.withOpacity(check / maxList)
                  : AppColors.textColor.withOpacity(0.2)
              : Colors.transparent,
        ),
      ),
    );
  }

  Container endContainerGit(int middle, int i, int middleData, int maxOfList) {
    int check =
        (checkConstainInList(listDateTime[middle * 7 + i + middleData]));
    return Container(
      height: 16,
      width: 16,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: (check > 0)
            ? Colors.green.withOpacity(check / maxOfList)
            : AppColors.textColor.withOpacity(0.2),
      ),
    );
  }

  Expanded middleContainerGIt(int middleData, int i, int j, int maxOfList) {
    int check = checkConstainInList(listDateTime[middleData + 7 * i + j]);
    return Expanded(
      child: Container(
        height: 15,
        width: 15,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: (check > 0)
              ? Colors.green.withOpacity(check / maxOfList)
              : AppColors.textColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
