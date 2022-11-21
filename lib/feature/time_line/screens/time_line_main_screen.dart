import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';
import '../widgets/header_field.dart';
import '../widgets/task_item_card.dart';

DateTime timeCheck = DateTime(2022, 11, 21, 0, 0, 0);

class TimeLineMainScreen extends StatefulWidget {
  TimeLineMainScreen({super.key});

  @override
  State<TimeLineMainScreen> createState() => _TimeLineMainScreenState();
}

class _TimeLineMainScreenState extends State<TimeLineMainScreen> {
  bool check = true;
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
  RxList<Map<String, dynamic>> listTaskCard2 = [
    {
      'mainTitle': "Design UX research for landing  page",
      'date': timeCheck.add(const Duration(days: 2)),
      'dude': timeCheck.add(const Duration(days: 3)),
      'image': 'assets/images/person1.png',
      'check': false.obs,
    },
    {
      'mainTitle': "Start UI design once UX done1",
      'date': timeCheck.add(const Duration(days: 4)),
      'dude': timeCheck.add(const Duration(days: 5)),
      'image': 'assets/images/person1.png',
      'check': true.obs,
    },
    {
      'mainTitle': "Start UI design once UX done",
      'date': timeCheck.add(const Duration(hours: 0)),
      'dude': timeCheck.add(const Duration(days: 1)),
      'image': 'assets/images/person1.png',
      'check': false.obs,
    },
  ].obs;
  RxList<Map<String, dynamic>> listTaskCard3 = [
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
      'dude': timeCheck.add(const Duration(days: 1)),
      'image': 'assets/images/person.png',
      'check': false.obs,
    },
  ].obs;
  List<List<Map<String, dynamic>>> listTask1 = [];
  List<List<Map<String, dynamic>>> listTask2 = [];
  List<List<Map<String, dynamic>>> listTask3 = [];

  int returnIndexTask(DateTime sDate, DateTime eDate,
      List<List<Map<String, dynamic>>> listCheck) {
    for (int i = 0; i < listCheck.length; i++) {
      int check = 0;
      for (int j = 0; j < listCheck[i].length; j++) {
        if ((sDate.isBefore(listCheck[i][j]['date']) &&
                eDate.isAfter(listCheck[i][j]['dude'])) ||
            (sDate.isAfter(listCheck[i][j]['date']) &&
                eDate.isBefore(listCheck[i][j]['dude']))) {
          check = -1;
          break;
        }
      }
      if (check == 0) return i;
    }
    return -1;
  }

  List<List<Map<String, dynamic>>> getRowTaskCard(
      RxList<Map<String, dynamic>> l) {
    List<List<Map<String, dynamic>>> data = [];
    for (var item in l.value) {
      int index = returnIndexTask(item['date'], item['dude'], data);
      if (index == -1) {
        data.add([item]);
      } else {
        data[index].add(item);
      }
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    listTask1 = getRowTaskCard(listTaskCard);
    listTask2 = getRowTaskCard(listTaskCard2);
    listTask3 = getRowTaskCard(listTaskCard3);
    setState(() {});
  }

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
            _taskHeaderBoardFiled(),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 0.3,
                  color: Colors.grey,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      Obx(
                        () => Column(
                          children: [
                            ...listTask1.map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...e.map(
                                        (a) => TaskItemCard(
                                          checkBox: a['check'].value,
                                          onChange: (value) =>
                                              a['check'].value = value,
                                          mainTitle: a['mainTitle'],
                                          date: a['date'],
                                          image: a['image'],
                                          due: a['dude'],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 121, 105, 105),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/person.png',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            " Nguyen Minh Hung ",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.more_vert,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(thickness: 1),
                  const SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      Obx(
                        () => Column(
                          children: [
                            ...listTask2.map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...e.map(
                                        (a) => TaskItemCard(
                                          checkBox: a['check'].value,
                                          onChange: (value) =>
                                              a['check'].value = value,
                                          mainTitle: a['mainTitle'],
                                          date: a['date'],
                                          image: a['image'],
                                          due: a['dude'],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 121, 105, 105),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/person1.png',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            " Nguyen Minh Hung ",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.more_vert,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _taskHeaderBoardFiled() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < 7; i++)
              SizedBox(
                width: 350.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (i + 20).toString(),
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
