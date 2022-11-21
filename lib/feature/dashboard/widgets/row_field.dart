import 'package:flutter/material.dart';

import '../../../constants/reponsiveness.dart';

class Row2Field extends StatelessWidget {
  final int? check;
  final List<Widget> childre;
  const Row2Field({super.key, required this.childre, this.check});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(children: childre)
        : Row(
            crossAxisAlignment: check != null
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: childre);
  }
}
  