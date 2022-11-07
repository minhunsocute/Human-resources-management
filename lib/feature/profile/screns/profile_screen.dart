import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/feature/auth/screens/sign_in%20_screen.dart';
import 'package:ueh_project_admin/feature/dashboard/widgets/row_field.dart';
import 'package:ueh_project_admin/widgets/custom_button.dart';

import '../../../constants/app_color.dart';
import '../../../constants/reponsiveness.dart';
import '../../dashboard/widgets/field_auto.dart';
import '../../employ/screens/employ_main_screen.dart';
import '../widgets/button_contact.dart';
import '../widgets/setting_item.dart';

final _controller = TextEditingController();

List<Map<String, dynamic>> listPages = [
  {
    'check': 0,
    'title': 'Change Basic Information',
    'page': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Change  Basicconst  Information',
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        CustomTextField(
          hintText: 'Enter New Name',
          icon: Icons.person,
          controller: _controller,
        ),
        const SizedBox(height: 10.0),
        CustomTextField(
          maxLines: 3,
          hintText: 'Enter Description',
          icon: Icons.description,
          controller: _controller,
        ),
        const SizedBox(height: 10.0),
        CustomTextField(
          hintText: 'Enter Location',
          icon: Icons.location_on_sharp,
          controller: _controller,
        ),
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.type_specimen, color: Colors.grey),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Software Engineer',
                  style: TextStyle(color: AppColors.textColor, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: CustomButton(
                text: 'Update',
                onTap: () {},
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ],
    ),
  },
  {
    'check': 1,
    'title': 'Change Password',
    'page': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Change  Pasword',
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        CustomPasswordField(
          hintText: 'Enter Your Password',
          controller: _controller,
        ),
        const SizedBox(height: 10.0),
        CustomPasswordField(
          hintText: 'Enter New Password',
          controller: _controller,
        ),
        const SizedBox(height: 10.0),
        CustomPasswordField(
          hintText: 'Enter Re-Password',
          controller: _controller,
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: CustomButton(
                backgroundColor: Colors.blue,
                text: 'Update',
                onTap: () {},
              ),
            )
          ],
        ),
      ],
    ),
  },
  {
    'check': 2,
    'title': 'Contact Setting',
    'page': Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Contact Information',
        style:
            TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10.0),
      SettingItem(
          title: '0935703991',
          subTitle: 'Phone number',
          press: () {},
          icon: Icons.phone),
      const SizedBox(height: 10),
      SettingItem(
          title: 'hungnguyen.201102ak@gmail.com',
          subTitle: 'Email',
          press: () {},
          icon: Icons.email),
      const SizedBox(height: 10.0),
      InkWell(
        onTap: () {},
        child: Row(
          children: const [
            Icon(Icons.add_location_alt_sharp, color: Colors.blue, size: 18.0),
            SizedBox(width: 5.0),
            Text(
              'Add new Address',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20.0),
      const Text(
        'Sites and Affiliates',
        style:
            TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      SettingItem(
          title: 'Nguyen Minh Hung',
          subTitle: 'Facebook',
          press: () {},
          icon: Icons.facebook),
      const SizedBox(height: 10.0),
      SettingItem(
          title:
              'https://www.facebook.com/profile.php?id=100048245345813&sk=about_contact_and_basic_info',
          subTitle: 'Instagram',
          press: () {},
          icon: Icons.online_prediction),
      const SizedBox(height: 10.0),
      InkWell(
        onTap: () {},
        child: Row(
          children: const [
            Icon(Icons.control_point_duplicate, color: Colors.blue, size: 18.0),
            SizedBox(width: 5.0),
            Text(
              'Add new contact',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20.0),
      const Text(
        'Basic Information',
        style:
            TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      SettingItem(
        title: 'Male',
        subTitle: 'Sex',
        press: () {},
        icon: Icons.person,
      ),
      const SizedBox(height: 10),
      SettingItem(
        title: '20/11/2002',
        subTitle: 'Birthday',
        press: () {},
        icon: Icons.cake,
      ),
    ]),
  },
];

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  RxInt check = 0.obs;
  @override
  Widget build(BuildContext context) {
    final isCustomScreen = ResponsiveWidget.isSmallCustomSize(context);
    final isSmasllScreen = ResponsiveWidget.isSmallScreen(context);
    var heightDevice = MediaQuery.of(context).size.height;
    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/sea.jpg'),
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.textColor.withOpacity(0.4),
          blurRadius: 10.0,
        ),
      ],
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Container(
              width: isCustomScreen ? double.infinity : 1100,
              height: heightDevice / 3,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: decoration,
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 180,
                    height: 40,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.5),
                          ],
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera_alt_rounded, color: Colors.blue),
                        Text(
                          ' Change cover photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 10.0),
          Container(
            width: isCustomScreen ? double.infinity : 1100,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.4),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row2Field(
              check: 1,
              childre: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/person.png'),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textColor.withOpacity(0.4),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                ),
                isSmasllScreen
                    ? Column(
                        children: const [
                          SizedBox(height: 10.0),
                          Divider(thickness: 1),
                          SizedBox(height: 10.0),
                        ],
                      )
                    : const SizedBox(width: 20.0),
                FieldAuto(
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Nguyen Minh Hung',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Software Engineer',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0),
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: const [
                              Icon(Icons.location_on,
                                  color: Colors.blue, size: 18.0),
                              Expanded(
                                child: Text(
                                  ' 22 Chu Van An , Thi Xa An Khe, Gia Lai',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: const [
                              Icon(Icons.phone, color: Colors.blue, size: 18.0),
                              Expanded(
                                child: Text(
                                  ' +84.935703991',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: const [
                              Icon(Icons.mail, color: Colors.blue, size: 18.0),
                              Expanded(
                                child: Text(
                                  ' hungnguyen.201102ak@gmail.com',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (!isSmasllScreen)
                      Container(width: 0.3, height: 150, color: Colors.grey),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonContact(
                            image: 'assets/images/facebook.png',
                            title: 'Facebook',
                            color: Colors.blue.withOpacity(0.4),
                            press: () {},
                          ),
                          const SizedBox(height: 10.0),
                          ButtonContact(
                            image: 'assets/images/instagram.png',
                            title: 'Instagram',
                            color: Colors.purple.withOpacity(0.4),
                            press: () {},
                          ),
                          const SizedBox(height: 10.0),
                          ButtonContact(
                            image: 'assets/images/twitter.png',
                            title: 'Twitter',
                            color: Colors.blue.withOpacity(0.4),
                            press: () {},
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(thickness: 1),
          const SizedBox(height: 10.0),
          Container(
            width: isCustomScreen ? double.infinity : 1100,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.4),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description:',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'I am an experienced joiner with well developed skills and experience in groundwork, concrete finishing and steel fixing and have worked in the construction industry since 1982. I am also a skilled labourer who has supported many different trades over the years. I have a full clean UK driving licence with entitlement of up to 7.5 tonne. I am keen to return to work after a period of training and personal development which has broadened my skills and experiences.',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                const Divider(thickness: 1),
                const SizedBox(height: 10.0),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.favorite, color: Colors.red.withOpacity(0.8)),
                  const Text(
                    ' 10.k follower . 100 following',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.send, color: Colors.blue.withOpacity(0.8)),
                  const Text(
                    ' 2 Message today',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: isCustomScreen ? double.infinity : 1100,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.3),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Row2Field(
              childre: [
                SizedBox(
                  width: isSmasllScreen ? double.infinity : 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Information',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Obx(() => Column(
                            children: [
                              ...listPages.map(
                                (e) => InkWell(
                                  onTap: () => check.value = e['check'],
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: check.value == e['check']
                                          ? Colors.blue.withOpacity(0.2)
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      e['title'],
                                      style: TextStyle(
                                          color: e['check'] == check.value
                                              ? Colors.blue
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                isSmasllScreen
                    ? Column(
                        children: const [
                          SizedBox(height: 10.0),
                          Divider(thickness: 1),
                          SizedBox(height: 10.0),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(width: 10.0),
                          Container(
                              width: 0.3, height: 150, color: Colors.grey),
                          const SizedBox(width: 10),
                        ],
                      ),
                Obx(
                  () => FieldAuto(child: listPages[check.value]['page']),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
