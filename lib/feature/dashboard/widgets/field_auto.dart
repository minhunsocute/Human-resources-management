import 'package:flutter/material.dart';

import '../../../constants/reponsiveness.dart';

class FieldAuto extends StatelessWidget {
  final Widget child;
  final int? flex;
  const FieldAuto({super.key, required this.child, this.flex});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(width: double.infinity, child: child),
          )
        : Expanded(flex: flex ?? 1, child: child);
  }
}
