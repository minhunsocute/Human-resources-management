import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isOpened = false.obs;
  void openAppBar() {
    isOpened.value = !isOpened.value;
  }
}
