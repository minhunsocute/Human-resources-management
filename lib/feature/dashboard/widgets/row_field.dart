import 'package:flutter/material.dart';

import '../../../constants/reponsiveness.dart';

class Row2Field extends StatelessWidget {
  final List<Widget> childre;
  const Row2Field({super.key, required this.childre});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(children: childre)
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: childre);
  }
}
