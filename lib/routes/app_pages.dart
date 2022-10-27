import 'package:get/get.dart';
import 'package:ueh_project_admin/routes/route_name.dart';

import '../feature/auth/screens/sign_in _screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.signInScreen,
      page: () => SignInScreen(),
      // binding: DashboardBinding(),
    ),
  ];
}
