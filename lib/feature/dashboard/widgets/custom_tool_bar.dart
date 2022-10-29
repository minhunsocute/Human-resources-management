import 'package:flutter/material.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/tool_bar_button_item.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/tool_bar_item.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 0.1, color: Colors.black),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ToolBarTextItem(
            text: 'Issues (2)',
            color: Colors.blue,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
            onTap: () {},
          ),
          ToolBarTextItem(
            text: 'Process',
            color: Colors.black,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
            onTap: () {},
          ),
          ToolBarTextItem(
            text: 'Employees',
            color: Colors.black,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
            ),
            onTap: () {},
          ),
          ToolBarTextItem(
            text: 'More',
            color: Colors.black,
            decoration: null,
            onTap: () {},
          ),

          ///////////////////////////////////////////////////////
          const Spacer(),
          ///////////////////////////////////////////////////////

          const ToolBarButtonItem(
            title: 'Share',
            icon: Icon(
              Icons.share_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const ToolBarButtonItem(
            title: 'Print',
            icon: Icon(
              Icons.print_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const ToolBarButtonItem(
            title: 'New',
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
