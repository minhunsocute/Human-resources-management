import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ueh_project_admin/feature/contest/widgets/show_entries_widget.dart';

import '../controller/contest_management_controller.dart';
import 'custom_icon_button.dart';
import 'employee_result_row.dart';
import 'filter_card.dart';

class EmployeeListTable extends StatelessWidget {
  EmployeeListTable({super.key});

  final contestManagementController = Get.put(ContestManagementController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Patient List',
                  style: Theme.of(context).textTheme.headline2,
                ),
                CustomIconButton(
                  onPressed: () {},
                  label: const Text(
                    'Add Employee',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  icon: const Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => ShowEntriesWidget(
                    applyEntries: contestManagementController.applyEntries,
                    numberOfEntries:
                        contestManagementController.numberOfEntries.value - 1,
                    width: constraints.maxWidth * 0.03,
                    height: constraints.maxHeight * 0.05,
                    maxEntries:
                        contestManagementController.data.value.length - 1,
                  ),
                ),
                CustomIconButton(
                  onPressed: () {},
                  label: Text(
                    'Filter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.blueGrey,
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  child: FilterCategory(
                    title: 'Patient',
                    hint: 'Patient name, Patient id, etc',
                    iconData: Icons.search_outlined,
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: FilterCategory(
                    title: 'Category',
                    hint: 'All Category',
                    iconData: Icons.category_outlined,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: FilterCategory(
                    title: 'Date of Joining',
                    hint: DateFormat()
                        .add_yMd()
                        .format(DateTime.now())
                        .toString(),
                    iconData: Icons.calendar_month_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: contestManagementController.numberOfEntries.value * 60,
              child: Obx(
                () => ListView.builder(
                  itemExtent: 60,
                  itemCount: contestManagementController.numberOfEntries.value,
                  itemBuilder: (context, index) => EmployeeResult(
                    index: index,
                    removeEntries: contestManagementController.removeEntries,
                    name: contestManagementController.data.value[index]
                        ['name']!,
                    id: contestManagementController.data.value[index]['id']!,
                    date: contestManagementController.data.value[index]
                        ['date']!,
                    gender: contestManagementController.data.value[index]
                        ['gender']!,
                    diseases: contestManagementController.data.value[index]
                        ['diseases']!,
                    status: contestManagementController.data.value[index]
                        ['status']!,
                    payment: contestManagementController.data.value[index]
                        ['payment']!,
                    avt: 'images/fake_avatar.jpg',
                    color: index == 0 ? Colors.blueGrey[50]! : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
