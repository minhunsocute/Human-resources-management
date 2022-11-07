import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class PopupButton extends StatelessWidget {
  final String message;
  final Widget child;
  final Color color;
  final Function() press;
  const PopupButton({
    Key? key,
    required this.message,
    required this.child,
    required this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor.withOpacity(0.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
