import 'package:flutter/material.dart';

import '../../../constants/reponsiveness.dart';

class Row2Field extends StatelessWidget {
  final int? check;
  final List<Widget> children;
  const Row2Field({super.key, required this.children, this.check});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(children: children)
        : Row(
            crossAxisAlignment: check != null
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: children);
  }
}
