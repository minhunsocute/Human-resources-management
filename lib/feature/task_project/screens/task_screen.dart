import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';

import '../../../constants/app_color.dart';
import '../../../constants/reponsiveness.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Row2Field(
          childre: [
            FieldAuto(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  margin: ResponsiveWidget.isSmallScreen(context)
                      ? const EdgeInsets.symmetric(horizontal: 20.0)
                      : const EdgeInsets.only(right: 20.0),
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
                      children: [
                        const Text(
                          'List Project',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        const SizedBox(width: 20.0),
                        const Text(
                          'Search',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(child: TextFormField()),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const [
                        Expanded(
                          flex: 1,
                          child: Text('PROJECT NAME',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('TIME START -> DEADLINE',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('PROGRESS',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('TASK',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('MEMBER',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Divider(thickness: 1),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Mmanue UIKit",
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(children: [
                              const Icon(Icons.calendar_month,
                                  size: 16.0, color: Colors.grey),
                              Text('20/11/2022',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0)),
                              const SizedBox(width: 15.0),
                              Text('-',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0)),
                              const SizedBox(width: 15.0),
                              const Icon(Icons.calendar_month,
                                  size: 16.0, color: AppColors.primaryColor),
                              Text('20/11/2022',
                                  style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0)),
                            ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: LinearPercentIndicator(
                              percent: 0.5,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              progressColor: Colors.red.withOpacity(0.8),
                              lineHeight: 8,
                              // ignore: deprecated_member_use
                              barRadius: const Radius.circular(20.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '45 task ',
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
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/person.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10.0,
                                        color: AppColors.textColor
                                            .withOpacity(0.3),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )),
            FieldAuto(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                margin: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 20.0),
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
