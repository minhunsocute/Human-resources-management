import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../constants/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../constants/reponsiveness.dart';
import 'home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundCOlor,
      body: HomeScreen(),
    );
  }
}
