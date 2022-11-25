import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/utils.dart';
import 'package:ueh_project_admin/feature/auth/screens/sign_in%20_screen.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/feature/employee/screens/employee_profile_screen.dart';
import 'package:ueh_project_admin/feature/home/screens/home_screen.dart';
import 'package:ueh_project_admin/widgets/custom_button.dart';
import '../../../constants/app_color.dart';
import '../../../constants/reponsiveness.dart';
import '../widgets/button_icon.dart';
import '../widgets/employee_progress_item.dart';
import '../widgets/recruitment_progress_item.dart';
import '../widgets/top_employee.dart';

List<Map<String, dynamic>> listEmployeeFakeData = [
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Learning',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  },
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Examining',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  },
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Learning',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  },
  {
    'image': 'assets/images/person.png',
    'name': 'Truong Huynh Duc hoang',
    'type': 'Backend Developer',
    'status': 'Examining',
    'email': 'hoang.201102ak@gmail.com',
    'phoneNumber': '0935703991',
  }
];

class EmployMainScreen extends StatelessWidget {
  EmployMainScreen({super.key});
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TopEmployeeWidget(
                name: "HEAD OF THE DEPARTMENT",
                image: "assets/images/person.png",
                description:
                    "Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.",
                type: "Dentist",
                ratings: 4.8,
              ),
              TopEmployeeWidget(
                name: "HEAD OF THE DEPARTMENT",
                image: "assets/images/person.png",
                description:
                    "Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.",
                type: "Dentist",
                ratings: 4.8,
              ),
              TopEmployeeWidget(
                name: "HEAD OF THE DEPARTMENT",
                image: "assets/images/person.png",
                description:
                    "Doctors, also known as physicians, are licensed health professionals who maintain and restore human health through the practice of medicine. They examine patients, review their medical history, diagnose illnesses or injuries, administer treatment, and counsel patients on their health and well-being.",
                type: "Dentist",
                ratings: 4.8,
              )
            ],
          ),
        ),
        const SizedBox(height: 40.0),
        Row2Field(
          children: [
            FieldAuto(
              flex: 3,
              child: Container(
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
                child: const TableListEmployee(),
              ),
            ),
            FieldAuto(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                margin: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(left: 10.0, right: 20.0),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'View Employ',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          const SizedBox(width: 50.0),
                          ButtonIcon(
                            title: 'View',
                            press: () {},
                            icon: Icons.person,
                            color1: AppColors.primaryColor,
                            color2: AppColors.primaryColor.withOpacity(0.4),
                          ),
                          const SizedBox(width: 20.0),
                          ButtonIcon(
                            title: 'Delete',
                            press: () {},
                            icon: Icons.delete,
                            color1: Colors.red,
                            color2: Colors.red.withOpacity(0.4),
                          ),
                          const SizedBox(width: 20.0),
                          ButtonIcon(
                            title: 'Add',
                            press: () {},
                            icon: Icons.add,
                            color1: Colors.blue,
                            color2: Colors.blue.withOpacity(0.4),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Divider(
                      thickness: 1.0,
                    ),
                    const SizedBox(height: 20.0),
                    Row3Field(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      childre: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/person1.png',
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.textColor.withOpacity(0.3),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Tap to change Avata',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            )
                          ],
                        ),
                        const SizedBox(width: 12.0),
                        FieldAuto1(
                          child: Column(children: [
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              hintText: 'Name',
                              icon: Icons.person,
                              controller: _controller,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              hintText: 'Email',
                              icon: Icons.email,
                              controller: _controller,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              hintText: 'Contact Number',
                              icon: Icons.phone,
                              controller: _controller,
                            ),
                            const SizedBox(height: 10.0),
                            CustomTextField(
                              hintText: 'Job title',
                              icon: Icons.computer,
                              controller: _controller,
                            ),
                          ]),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Divider(thickness: 1.0),
                    const SizedBox(height: 10.0),
                    CustomButton(text: 'Update', onTap: () {})
                  ],
                ),
              ),
            )
          ],
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
                children: [
                  const Text(
                    'Employee Progress',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  ButtonIcon(
                    title: 'Completesd',
                    press: () {},
                    icon: Icons.change_circle_outlined,
                    color1: Colors.blue,
                    color2: Colors.blue.withOpacity(0.3),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
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
                    child: Text('NAME',
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
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('AMOUNT',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('DEADLINE',
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
              EmployeeProgressItem(
                image: 'assets/images/person.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                amount: 20.01,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
                time: DateTime.now(),
                percent: 0.6,
              ),
              const Divider(thickness: 1),
              EmployeeProgressItem(
                image: 'assets/images/person2.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                amount: 31.02,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
                time: DateTime.now(),
                percent: 0.3,
              ),
              const Divider(thickness: 1),
              EmployeeProgressItem(
                image: 'assets/images/person1.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                amount: 10.01,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
                time: DateTime.now(),
                percent: 0.8,
              ),
              const Divider(thickness: 1),
              EmployeeProgressItem(
                image: 'assets/images/person2.png',
                name: 'Truong Huynh Duc hoang',
                type: 'Backend Developer',
                amount: 12.2,
                email: 'hoang.201102ak@gmail.com',
                phoneNumber: '0935703991',
                time: DateTime.now(),
                percent: 0.1,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class TableListEmployee extends StatelessWidget {
  const TableListEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'List Employee',
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            ButtonIcon(
              title: 'Select Type',
              press: () {},
              icon: Icons.keyboard_arrow_down_rounded,
              color1: AppColors.primaryColor,
              color2: AppColors.primaryColor.withOpacity(0.4),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          children: Utils.tableTitleListEmployee,
        ),
        const SizedBox(height: 10.0),
        const Divider(thickness: 1),
        const SizedBox(height: 10.0),
        ...[
          for (var item in listEmployeeFakeData) ...[
            InkWell(
              onTap: () => Get.to(() => const EmployeeProfileScreen()),
              child: RecruitmentProgressItem(
                image: item['image'],
                name: item['name'],
                type: item['type'],
                status: item['status'],
                email: item['email'],
                phoneNumber: item['phoneNumber'],
              ),
            ),
            const Divider(thickness: 1),
          ]
        ],
      ],
    );
  }
}

class Row3Field extends StatelessWidget {
  final List<Widget> childre;
  const Row3Field({super.key, required this.childre});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isSmallScreen(context)
        ? Column(children: childre)
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: childre);
  }
}

class FieldAuto1 extends StatelessWidget {
  final Widget child;
  const FieldAuto1({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isSmallScreen(context)
        ? SizedBox(child: child)
        : Expanded(child: child);
  }
}
