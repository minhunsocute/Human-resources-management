import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/feature/employee/widgets/button_icon.dart';
import 'package:ueh_project_admin/feature/home/screens/home_screen.dart';
import 'package:ueh_project_admin/widgets/custom_button.dart';

import '../../../constants/app_color.dart';
import '../../../constants/utils.dart';
import '../../../widgets/column_2_chart.dart';
import '../../auth/screens/sign_in _screen.dart';
import '../widgets/custom_dialog_error/question_dialog.dart';
import '../widgets/git_hub_calender.dart';
import '../widgets/task_data_item.dart';

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
  ViewProjectScreen({super.key, required this.backFunc});
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                children: [
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
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.all(20.0),
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
            Column(
              children: [
                Container(
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
                    child: GitHubCalenderBuit(fakeDataCommit: fakeDataCommit)),
                const SizedBox(height: 10.0),
                SizedBox(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: contributionAcitvityField(DateTime.now()),
                    ),
                  ],
                ))
              ],
            )
          ]),
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
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'AllTask and Commitboard',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                ButtonIcon(
                  title: 'Add New Task',
                  press: () async => await showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: 500,
                        height: 800,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Add New Task',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              hintText: 'Enter Task Name',
                              icon: Icons.task,
                              controller: _textController,
                            ),
                            const SizedBox(height: 15.0),
                            CustomTextField(
                              hintText: 'Enter Description',
                              icon: Icons.description,
                              controller: _textController,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 5.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.calendar_month,
                                          color: Colors.grey)),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Text(
                                      'Choose Dead Time',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.textColor.withOpacity(0.4),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/person.png')),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Nguyen Minh Hung',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0)),
                                      Text('Software Engineer',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Column(children: const [
                              ChooseEmployForTaskItem(
                                image: 'assets/images/person.png',
                                name: "Nguyen Minh Hung",
                                type: "Software Engineer",
                              ),
                              Divider(thickness: 1),
                              ChooseEmployForTaskItem(
                                image: 'assets/images/person1.png',
                                name: "Truong Huynh Duc Hoang",
                                type: "Software Engineer",
                              ),
                              Divider(thickness: 1),
                              ChooseEmployForTaskItem(
                                image: 'assets/images/person2.png',
                                name: "Nguyen Trung Hieu",
                                type: "Software Engineer",
                              )
                            ]),
                            const Spacer(),
                            CustomButton(text: 'Create Task', onTap: () {})
                          ],
                        ),
                      ),
                    ),
                  ),
                  icon: Icons.add_task,
                  color1: Colors.blue,
                  color2: Colors.blue.withOpacity(0.5),
                )
              ],
            ),
            const SizedBox(height: 20.0),
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
                Expanded(
                  flex: 1,
                  child: Text('BUTTON',
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
            TaskViewitem(
                name: 'Coding Interview',
                nameUser: 'Nguyen Minh Hung',
                imageUser: 'assets/images/person2.png',
                deadTime: DateTime.now(),
                deleteFunc: () async => await showDialog(
                      context: context,
                      builder: (context) => const QuestionDialog(
                        question: 'Do you want delete this Task?',
                        title1: "This task will been deleted from this Project",
                        icon: Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                status: 1),
            TaskViewitem(
              name: 'Coding C++',
              nameUser: 'Nguyen Minh Hung',
              imageUser: 'assets/images/person.png',
              deadTime: DateTime.now(),
              status: 0,
              deleteFunc: () async => await showDialog(
                context: context,
                builder: (context) => const QuestionDialog(
                  question: 'Do you want delete this Task?',
                  title1: "This task will been deleted from this Project",
                  icon: Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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

class ChooseEmployForTaskItem extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  const ChooseEmployForTaskItem({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0)),
              Text(type,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0)),
            ],
          ),
        ],
      ),
    );
  }
}

class TaskViewitem extends StatelessWidget {
  final String name;
  final String nameUser;
  final String imageUser;
  final DateTime deadTime;
  final int status;
  final Function() deleteFunc;
  const TaskViewitem({
    Key? key,
    required this.name,
    required this.nameUser,
    required this.imageUser,
    required this.deadTime,
    required this.status,
    required this.deleteFunc,
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
              name,
              textAlign: TextAlign.start,
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imageUser)),
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
                    nameUser,
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
                const Icon(Icons.timelapse, color: AppColors.primaryColor),
                Expanded(
                  child: Text(
                    DateFormat().add_yMd().format(deadTime),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
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
                      color: status == 0
                          ? Colors.red.withOpacity(0.3)
                          : Colors.green.withOpacity(0.3),
                    ),
                    child: Text(
                      status == 0 ? 'UnCompleted' : 'Completed',
                      style: TextStyle(
                          color: status == 0 ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ButtonIcon(
                  title: 'Delete',
                  press: deleteFunc,
                  icon: Icons.delete,
                  color1: Colors.red,
                  color2: Colors.red.withOpacity(0.3),
                ),
                const SizedBox(width: 5.0),
                ButtonIcon(
                  title: 'Edit',
                  press: () {},
                  icon: Icons.edit,
                  color1: Colors.blue,
                  color2: Colors.blue.withOpacity(0.3),
                )
              ]),
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
