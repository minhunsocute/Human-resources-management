import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/routes/app_pages.dart';
import 'package:ueh_project_admin/routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UEH Project',
        theme: ThemeData(
          // fontFamily: 'Montserrat',
          // fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RouteNames.signInScreen,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
