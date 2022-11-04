import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
