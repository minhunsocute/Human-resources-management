import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/widgets/custom_button.dart';

import '../../../constants/app_color.dart';
import '../../../routes/route_name.dart';

PageController pageController = PageController(initialPage: 0, keepPage: true);
void onButtonTape(int index) {
  pageController.animateToPage(index,
      duration: const Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
//  pageController.jumpToPage(index);
}

List<Widget> listViewAuth = [
  SignInField(),
  SignUpField(),
];

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  // RxBool checkBox = false.obs;
  RxInt _currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: Row(
          children: [
            Image.asset('assets/images/app_icon.png',
                height: 50.0, width: 50.0),
            const Text(
              ' Employee Admin',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.primaryColor.withOpacity(0.4),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: 530,
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.7),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 450.0,
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        _currentIndex.value = value;
                      },
                      itemBuilder: (context, index) {
                        return listViewAuth[index];
                      },
                      itemCount: listViewAuth.length,
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listViewAuth.length,
                          itemBuilder: (context, index) => Obx(
                            () => buildIndicator(_currentIndex.value == index,
                                MediaQuery.of(context).size),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //container with border
        color: isActive ? Colors.purple : Colors.purple.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ],
      ),
    );
  }
}

class SignUpField extends StatelessWidget {
  SignUpField({super.key});
  final _password = TextEditingController();
  final _newPassword = TextEditingController();
  final _resetPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () => onButtonTape(0),
                  child:
                      const Icon(Icons.arrow_back, color: AppColors.textColor)),
              const SizedBox(width: 10),
              Image.asset('assets/images/app_icon.png',
                  height: 50.0, width: 50.0),
              const Text(
                ' Employee',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const Text(
                ' Admin',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Hello! let\'s create Account',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          const SizedBox(height: 4),
          const Text(
            'Sign up to create Account.',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ),
          const SizedBox(height: 20.0),
          CustomTextField(
              hintText: 'Username', icon: Icons.person, controller: _password),
          const SizedBox(height: 10.0),
          CustomPasswordField(
            hintText: 'New Password',
            controller: _newPassword,
          ),
          const SizedBox(height: 10.0),
          CustomPasswordField(
            hintText: 'Re Password',
            controller: _resetPassword,
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: 140,
            child: CustomButton(
              text: 'Sign Up',
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: const [
              Expanded(child: Divider()),
              Text(
                'Or',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Row(children: const [
                Icon(Icons.facebook, color: Colors.white),
                Text(
                  ' Sign In With Facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomPasswordField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.key, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInField extends StatelessWidget {
  SignInField({super.key});

  RxBool checkBox = false.obs;
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/app_icon.png',
                  height: 50.0, width: 50.0),
              const Text(
                ' Employee',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const Text(
                ' Admin',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Hello! let\'s get started',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          const SizedBox(height: 4),
          const Text(
            'Sign in to continue.',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ),
          const SizedBox(height: 20.0),
          CustomTextField(
            controller: _userNameController,
            hintText: 'Username',
            icon: Icons.person,
          ),
          const SizedBox(height: 10.0),
          CustomPasswordField(
              hintText: 'Password', controller: _passwordController),
          const SizedBox(height: 10.0),
          SizedBox(
            width: 140,
            child: CustomButton(
              text: 'Sign In',
              onTap: () => Get.toNamed(RouteNames.dashboardScreen),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Obx(
                () => Checkbox(
                    value: checkBox.value,
                    onChanged: (value) => checkBox.value = value!),
              ),
              const Text(
                ' Kepp me signed in',
                style: TextStyle(color: AppColors.textColor),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.grey, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Row(children: const [
                Icon(Icons.facebook, color: Colors.white),
                Text(
                  ' Sign In With Facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(color: AppColors.textColor, fontSize: 16.0),
              ),
              InkWell(
                onTap: () => onButtonTape(1),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final int? maxLines;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: 10.0, vertical: maxLines == null ? 0.0 : 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: (maxLines == null)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              maxLines: maxLines ?? 1,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
