import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controller/home_controller.dart';

class WeekCalendar extends StatelessWidget {
  WeekCalendar({super.key});
  final homeController = Get.find<HomeController>();
  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    int firstDayOfWeek = DateTime.sunday % 7;
    int endDayOfWeek = (firstDayOfWeek - 1) % 7;
    endDayOfWeek = endDayOfWeek < 0 ? 7 + endDayOfWeek : endDayOfWeek;
    PickerDateRange ranges = args.value;
    DateTime date1 = ranges.startDate!;
    DateTime date2 = (ranges.endDate ?? ranges.startDate)!;
    if (date1.isAfter(date2)) {
      var date = date1;
      date1 = date2;
      date2 = date;
    }
    int day1 = date1.weekday % 7;
    int day2 = date2.weekday % 7;

    DateTime dat1 = date1.add(Duration(days: (firstDayOfWeek - day1)));
    DateTime dat2 = date2.add(Duration(days: (endDayOfWeek - day2)));

    if (dat1.compareTo(ranges.startDate!) == 0 ||
        dat2.compareTo(ranges.endDate!) == 0) {
      homeController.dateController!.selectedRange =
          PickerDateRange(dat1, dat2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: Get.height * 0.6,
        width: Get.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: const EdgeInsets.fromLTRB(50, 100, 50, 100),
              child: SfDateRangePicker(
                controller: homeController.dateController,
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: selectionChanged,
                monthViewSettings: const DateRangePickerMonthViewSettings(
                    enableSwipeSelection: false),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                if (homeController.currentChart == "Turnover") {
                  homeController.flagChange.value =
                      (homeController.flagChange.value - 1).abs();
                } else if (homeController.currentChart ==
                    "Project Employment") {
                  homeController.flagChange1.value =
                      (homeController.flagChange1.value - 1).abs();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(Get.width * 0.4, 50),
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
