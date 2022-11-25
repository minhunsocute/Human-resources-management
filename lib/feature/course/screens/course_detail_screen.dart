import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../constants/app_color.dart';
import '../../../constants/fake_data.dart';
import '../../../constants/utils.dart';
import '../../../widgets/column_2_chart.dart';
import '../../home/screens/home_screen.dart';
import '../widget/line_chart_3line.dart';

List<Map<String, dynamic>> fakeData = [
  {
    "id": "113",
    "date": DateTime.now(),
    "cr": "Phong Kham noi 1",
    "pn": "Truong Huynh Duc Hoang",
    "status": 1,
  },
  {
    "id": "114",
    "date": DateTime.now(),
    "cr": "Phong Kham noi 2",
    "pn": "Nguyen Minh Hung",
    "status": 1,
  },
  {
    "id": "115",
    "date": DateTime.now(),
    "cr": "Phong Kham noi 3",
    "pn": "Nguyen Trung Hieu",
    "status": 2,
  },
  {
    "id": "116",
    "date": DateTime.now(),
    "cr": "Phong Kham noi 4",
    "pn": "Phan Thien Nhan",
    "status": 1,
  },
];

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listInfo = [
      {
        'image': 'assets/icons/people.svg',
        'title': 'patients',
        'data': '5.000+'
      },
      {
        'image': 'assets/icons/experiences.svg',
        'title': 'year experiences',
        'data': '10'
      },
      {'image': 'assets/icons/star.svg', 'title': 'rating', 'data': '4.8'},
      {'image': 'assets/icons/chat.svg', 'title': 'reviews', 'data': '4.942'},
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _inforField(),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
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
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      ...listLessons.map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: InkWell(
                                            onTap: () {},
                                            child: LessonItem(
                                              title: e['title'],
                                              h: e['hour'],
                                              m: e['minute'],
                                              check: e['check'],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, bottom: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.textColor
                                                    .withOpacity(0.2),
                                                blurRadius: 10.0),
                                          ],
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/course.png')),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, bottom: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.textColor
                                                    .withOpacity(0.2),
                                                blurRadius: 10.0),
                                          ],
                                          gradient: const LinearGradient(
                                            colors: [
                                              Colors.black38,
                                              Colors.black54
                                            ],
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.play_circle_fill,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  margin: const EdgeInsets.only(
                                      left: 10.0, top: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.textColor
                                              .withOpacity(0.2),
                                          blurRadius: 10.0),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Course Chart',
                                        style: TextStyle(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0),
                                      ),
                                      const SizedBox(height: 10),
                                      const Expanded(
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: LineChart3Line(
                                                isShowingMainData: true)),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
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
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.purple,
                                            ),
                                          ),
                                          const Text(
                                            ' New',
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
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Text(
                                            ' Failed Final Test',
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
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, top: 10.0, right: 10.0),
                                  // padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.textColor
                                              .withOpacity(0.2),
                                          blurRadius: 10.0),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10.0),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'List Employe',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ListEmployInCourseItem(
                                        image: 'assets/images/person.png',
                                        name: 'Nguyen Minh Hung',
                                        date: DateTime.now(),
                                      ),
                                      ListEmployInCourseItem(
                                        image: 'assets/images/person1.png',
                                        name: 'Truong Huynh Duc Hoang',
                                        date: DateTime.now(),
                                      ),
                                      ListEmployInCourseItem(
                                        image: 'assets/images/person2.png',
                                        name: 'Nguyen Trung Hieu',
                                        date: DateTime.now(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Expanded _inforField() {
    return Expanded(
      flex: 2,
      child: Container(
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
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Complete UX/UI & App Design',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                      children: [
                        TextSpan(
                          text: '\$',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: '20.00',
                          style: TextStyle(color: AppColors.textColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Text(
                        ' 4.8',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '2.8k enrolled',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(bottom: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue,
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
                            const Text(
                              'Rakib Kowshar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Product Designer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: const [
                                Text(
                                  '6 Coures ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 240),
                      child: Image.asset(
                        'assets/images/person3.png',
                        height: 200,
                        width: 200,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ReadMoreText(
                'Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.',
                trimLines: 4,
                style: TextStyle(color: AppColors.textColor),
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                lessStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '24 Lessons',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            RowSeeMore(
              title: 'Comments (8)',
              callback: () {},
            ),
            const SizedBox(height: 10.0),
            const CommentCard(
              name: 'Nguyen Minh Hung',
              image: 'assets/images/person.png',
              favCount: 300,
              title: 'Doctors who are very skilled and fast in service',
              day: 8,
              star: 3,
              checkLike: true,
              check: 1,
            ),
            const CommentCard(
              name: 'Nguyen Minh Hung',
              image: 'assets/images/person1.png',
              favCount: 300,
              title: 'Doctors who are very skilled and fast in service',
              day: 8,
              star: 3,
              checkLike: true,
              check: 1,
            ),
            const SizedBox(height: 10.0),
            const CommentCard(
              name: 'Nguyen Minh Hung',
              image: 'assets/images/person.png',
              favCount: 300,
              title: 'Doctors who are very skilled and fast in service',
              day: 8,
              star: 3,
              checkLike: true,
              check: 1,
            ),
            const SizedBox(height: 10.0),
            const CommentCard(
              name: 'Nguyen Minh Hung',
              image: 'assets/images/person.png',
              favCount: 300,
              title: 'Doctors who are very skilled and fast in service',
              day: 8,
              star: 3,
              checkLike: true,
              check: 1,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class ListEmployInCourseItem extends StatelessWidget {
  final String image;
  final String name;
  final DateTime date;
  const ListEmployInCourseItem({
    Key? key,
    required this.image,
    required this.name,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.clock,
                        color: Colors.grey, size: 17.0),
                    Text(
                      ' ${DateFormat().add_yMEd().format(date)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.5),
                        Colors.blue.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: const Text(
                    '80/90',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String image;
  final int star;
  final String name;
  final String title;
  final bool checkLike;
  final int favCount;
  final int day;
  final int? check;
  final double? hori;
  const CommentCard({
    Key? key,
    required this.image,
    required this.star,
    required this.name,
    required this.title,
    required this.checkLike,
    required this.favCount,
    required this.day,
    this.check = 2,
    this.hori,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hori ?? 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              check == 1
                  ? Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(image),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: AppColors.textColor.withOpacity(0.2),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: AppColors.textColor.withOpacity(0.2),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                width: 65,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 2, color: Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      star.toString(),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.more_horiz, color: AppColors.textColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: AppColors.textColor, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: checkLike
                    ? const Icon(Icons.favorite, color: Colors.blue)
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.blue,
                      ),
              ),
              const SizedBox(width: 10),
              Text(
                favCount.toString(),
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                '$day days ago',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowSeeMore extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const RowSeeMore({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          InkWell(
            onTap: callback,
            child: const Text(
              'See More',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  final String title;
  final int h;
  final int m;
  final bool check;
  const LessonItem({
    Key? key,
    required this.title,
    required this.h,
    required this.m,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Time',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '$h:$m',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(right: 15.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: AppColors.textColor,
                      ),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: AppColors.textColor,
                      size: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
