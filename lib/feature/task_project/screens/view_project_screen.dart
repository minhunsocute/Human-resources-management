import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class ViewProjectScreen extends StatelessWidget {
  final Function() backFunc;
  const ViewProjectScreen({super.key, required this.backFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: AppColors.textColor.withOpacity(0.2),
            //     blurRadius: 10.0,
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Clinical Management Project',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "In Progress",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Divider(thickness: 1),
              const SizedBox(height: 10.0),
              Row(
                children: const [
                  Text(
                    'Members: ',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  ImgeItem(image: 'assets/images/person.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person1.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person2.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person1.png'),
                  SizedBox(width: 5.0),
                  ImgeItem(image: 'assets/images/person2.png'),
                  SizedBox(width: 5.0),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Icon(Icons.calendar_month,
                      size: 16.0, color: Colors.grey),
                  Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const SizedBox(width: 15.0),
                  const Text('-',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const SizedBox(width: 15.0),
                  const Icon(Icons.calendar_month,
                      size: 16.0, color: AppColors.primaryColor),
                  Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                ],
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Description',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sollicitudin, urna a mollis imperdiet, tellus nisi euismod turpis, eget mollis diam ligula quis sem. Fusce volutpat nisl vitae nulla aliquet dapibus. Vestibulum quis libero gravida, pellentesque nisi id, malesuada leo. Duis sodales fringilla erat, ut tempus sapien accumsan sed. Vestibulum eu risus eget ligula tincidunt volutpat et non odio. Donec vel facilisis neque. Integer interdum suscipit risus. Suspendisse sodales nisl vel tortor euismod vulputate. Ut a est tincidunt, posuere massa non, dictum odio.',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ImgeItem extends StatelessWidget {
  final String image;
  const ImgeItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: AppColors.textColor.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
