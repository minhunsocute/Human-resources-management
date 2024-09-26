import 'package:flutter/material.dart';
import 'package:ueh_project_admin/feature/auth/screens/sign_in%20_screen.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/field_auto.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/feature/employee/screens/employ_main_screen.dart';
import 'package:ueh_project_admin/widgets/custom_button.dart';

import '../../../constants/app_color.dart';
import '../../../constants/reponsiveness.dart';
import '../../../constants/utils.dart';

const List<Item> _items = [
  Item(
      id: '1',
      name: 'Duc Hoang',
      type: 'Backend Developer',
      image: 'assets/images/person1.png'),
  Item(
      id: '2',
      name: 'Minh Hung',
      type: 'Frontend Developer',
      image: 'assets/images/person2.png'),
  Item(
      id: '3',
      name: 'Trung Hieu',
      type: 'UI/UX Designer',
      image: 'assets/images/person.png'),
];

List<Map<String, dynamic>> fakeDataMembers = [
  {
    'id': '1',
    'name': 'Duc Hoang',
    'imagePath': 'assets/images/person.png',
    'type': 'Backend Developer',
  },
  {
    'id': '2',
    'name': 'Minh Hung',
    'imagePath': 'assets/images/person1.png',
    'type': 'Frontend Developer',
  },
  {
    'id': '3',
    'name': 'Trung Hieu',
    'imagePath': 'assets/images/person2.png',
    'type': 'UI/UX Designer',
  }
];

class CreateProjectScreen extends StatefulWidget {
  CreateProjectScreen({super.key});
  String? restorationId;
  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen>
    with RestorationMixin {
  final _controller = TextEditingController();
  final GlobalKey _draggableKey = GlobalKey();

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  List<Item> listItem = [];
  void _itemDroppedOnCustomerCart({
    required Item item,
    // required Customer customer,
  }) {
    setState(() {
      listItem.add(item);
    });
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Row3Field(
          childre: [
            FieldAuto2(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                margin: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textColor.withOpacity(0.2),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Create Project',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      hintText: 'Enter project Name',
                      icon: Icons.task,
                      controller: _controller,
                    ),
                    const SizedBox(height: 15.0),
                    CustomTextField(
                      hintText: 'Enter Description',
                      icon: Icons.description,
                      controller: _controller,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 5.0),
                    Row3Field(
                      childre: [
                        FieldAuto1(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            margin: ResponsiveWidget.isMediumScreen(context) ||
                                    ResponsiveWidget.isSmallScreen(context)
                                ? const EdgeInsets.symmetric(vertical: 10.0)
                                : const EdgeInsets.only(
                                    right: 10.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _restorableDatePickerRouteFuture
                                          .present();
                                    },
                                    icon: const Icon(Icons.calendar_month,
                                        color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    'Choose Start Time',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FieldAuto1(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            margin: ResponsiveWidget.isMediumScreen(context) ||
                                    ResponsiveWidget.isSmallScreen(context)
                                ? const EdgeInsets.symmetric(vertical: 10.0)
                                : const EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.calendar_month,
                                        color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    'Choose Dead Time',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.textColor.withOpacity(0.3),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Add Member',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          DragTarget<Item>(
                            builder: (context, candidateItems, rejectedItems) {
                              return (listItem.isNotEmpty)
                                  ? Container(
                                      // padding: const EdgeInsets.all(5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Wrap(
                                        children: [
                                          ...listItem.map(
                                            (e) => EmploySelectedItem(e: e),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 80,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.download,
                                              color: AppColors.primaryColor,
                                            ),
                                            Text(
                                              'Drop Here',
                                              style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                            },
                            onAccept: (item) =>
                                _itemDroppedOnCustomerCart(item: item),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(thickness: 1),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 120,
                          child: CustomButton(
                            text: 'Null All Field',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 140,
                          child: CustomButton(
                            text: 'Create Project',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FieldAuto2(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                margin: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.symmetric(horizontal: 20.0)
                    : const EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textColor.withOpacity(0.2),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(children: [
                  Row(
                    children: [
                      const Text(
                        'List Member',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      const SizedBox(width: 20.0),
                      const Text(
                        'Search',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(child: TextFormField()),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ..._items.map(
                    (e) => LongPressDraggable(
                      data: e,
                      dragAnchorStrategy: pointerDragAnchorStrategy,
                      feedback: DraggingListItem(
                        dragKey: _draggableKey,
                        photoProvider: AssetImage(e.image),
                      ),
                      child: ItemCard(e: e),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class EmploySelectedItem extends StatelessWidget {
  final Item e;
  const EmploySelectedItem({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: const Icon(Icons.close, color: Colors.red, size: 18.0),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(e.image),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              e.name,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.e,
  }) : super(key: key);
  final Item e;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(e.image),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.name,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  e.type,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                const Text(
                  '3 year experiences',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.8,
            height: 80,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: 50,
            height: 80,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_circle_right_rounded,
                    color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
  });
  final String id;
  final String name;
  final String type;
  final String image;
  String get getID => id;
}

class FieldAuto2 extends StatelessWidget {
  final Widget child;
  final int? flex;
  const FieldAuto2({super.key, required this.child, this.flex});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context) ||
            ResponsiveWidget.isMediumScreen(context)
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(width: double.infinity, child: child),
          )
        : Expanded(flex: flex ?? 1, child: child);
  }
}
