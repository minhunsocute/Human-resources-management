import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeController extends GetxController {
  String currentChart = "";
  final DateRangePickerController? dateController = DateRangePickerController();
  Rx<int> flagChange = 0.obs;
  Rx<int> flagChange1 = 0.obs;
}
