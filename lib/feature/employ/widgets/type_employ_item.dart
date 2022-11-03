import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

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
          '${i * 10 + 10}',
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
