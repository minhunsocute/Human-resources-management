import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project_admin/constants/fake_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ueh_project_admin/feature/course/screens/course_detail_screen.dart';

import '../../../constants/app_color.dart';

class CourseMainScreen extends StatelessWidget {
  const CourseMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.computer,
                      color: Colors.black, size: 30.0),
                  Text(
                    '  Course',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...fakeDataCourseCate.map(
                    (e) => Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 2, color: e['color']),
                      ),
                      child: Row(children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: e['color']),
                          child: const Icon(
                            Icons.file_copy,
                            color: Colors.white,
                            size: 26.0,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          e['title'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        const SizedBox(width: 40.0),
                      ]),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(height: 20.0),
            Wrap(
              children: [
                ...fakeDataCourse.map(
                  (e) => CourseCard(e: e),
                ),
              ],
            )
          ],
        ),
      ),
      const SizedBox(width: 10.0),
      Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.blue, size: 30.0),
                  Text(
                    ' Top Course',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              ...fakeDataCourse.map(
                (e) => Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textColor.withOpacity(0.3),
                            blurRadius: 10.0,
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(e['imge']),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['title'],
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.blue,
                              size: 26.0,
                            ),
                            Text(
                              '  14 lessons',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.blue,
                              size: 26.0,
                            ),
                            Text(
                              '  ${DateFormat().add_yMEd().format(DateTime.now())} - ${DateFormat().add_yMEd().format(DateTime.now())}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              FontAwesomeIcons.peopleGroup,
                              color: Colors.blue,
                              size: 26.0,
                            ),
                            Text(
                              '  300 Employee',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class CourseCard extends StatelessWidget {
  final Map<String, dynamic> e;
  const CourseCard({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => Material(
            child: const CourseDetailScreen(),
          )),
      child: Container(
        height: 400,
        width: 300,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.textColor.withOpacity(0.3),
              blurRadius: 10.0,
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(e['imge']),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                    offset: const Offset(-2, -2),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.people,
                                  color: Colors.grey, size: 20.0),
                              Text(
                                '200 Employee',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(FontAwesomeIcons.clock,
                                  color: Colors.grey, size: 17.0),
                              Text(
                                ' 20 h 15 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        e['title'],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.only(right: 5.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/person.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'John Doe',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.favorite_outline,
                              color: Colors.black)
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
