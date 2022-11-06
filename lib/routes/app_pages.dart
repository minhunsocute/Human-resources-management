import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/dashboard/bindings/dashboard_binding.dart';
import 'package:ueh_project_admin/feature/dashboard/screens/dashboard_screen.dart';
import 'package:ueh_project_admin/routes/route_name.dart';

import '../feature/auth/screens/sign_in _screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: RouteNames.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
