import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';

class TaskItemCard extends StatelessWidget {
  final bool checkBox;
  final String mainTitle;
  final DateTime date;
  final DateTime due;
  final Function(bool) onChange;
  final String image;
  TaskItemCard({
    Key? key,
    required this.checkBox,
    required this.onChange,
    required this.mainTitle,
    required this.date,
    required this.image,
    required this.due,
  }) : super(key: key);
  int hoursBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute);
    to = DateTime(to.year, to.month, to.day, from.hour, from.minute);
    return to.difference(from).inMinutes;
  }

  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            width: hoursBetween(date, due) / 1440 * 350,
            margin: EdgeInsets.only(
                left: hoursBetween(DateTime(2022, 11, 20, 0, 0, 0), date) /
                    1440 *
                    350),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      onChanged: (v) => onChange(v!),
                      value: checkBox,
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainTitle,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 121, 105, 105),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  image,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ' ${DateFormat().add_yMMMMEEEEd().format(date)}',
                              // textAlign: TextAlign.center,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey,
                                fontSize: 20.0,
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
        ],
      ),
    );
  }
}

class TaskItemCardNormal extends StatelessWidget {
  final bool checkBox;
  final String mainTitle;
  final DateTime date;
  final DateTime due;
  final Function(bool) onChange;
  final String image;
  TaskItemCardNormal({
    Key? key,
    required this.checkBox,
    required this.onChange,
    required this.mainTitle,
    required this.date,
    required this.image,
    required this.due,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                onChanged: (v) => onChange(v!),
                value: checkBox,
              ),
            ],
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainTitle,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 121, 105, 105),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' ${DateFormat().add_yMMMMEEEEd().format(date)}',
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                          fontSize: 20.0,
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
    );
  }
}
