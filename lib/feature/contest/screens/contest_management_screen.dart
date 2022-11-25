import 'package:flutter/material.dart';

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
  const ContestManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
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
