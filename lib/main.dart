import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/routes/app_pages.dart';
import 'package:ueh_project_admin/routes/route_name.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Firebase
  FirebaseOptions firebaseOptions = const FirebaseOptions(
    apiKey: "AIzaSyA6sjb1xKNVuc9veRXTt510pLqSIGopRYg",
    appId: "1:461919376906:web:fa0135bd4e61f93272f1f3",
    messagingSenderId: "461919376906",
    projectId: "ueh-mlproject",
    storageBucket: "ueh-mlproject.appspot.com",
    authDomain: "AIzaSyA6sjb1xKNVuc9veRXTt510pLqSIGopRYg",
    measurementId: "G-LHHQSLKG12",
  );
  await Firebase.initializeApp(options: firebaseOptions);
  WidgetsFlutterBinding.ensureInitialized();
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
          dividerTheme: DividerThemeData(
              color: Colors.grey[400], thickness: 0.5, space: 10),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: AppColors.greyBackgroundCOlor,
        ),
        initialRoute: RouteNames.splashScreen,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
