import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ueh_project_admin/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ueh_project_admin/routes/route_name.dart';

class AuthController extends GetxController {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late final User? _user;
  late String initialPage;

  var isLoading = false.obs;

  User? getUser() {
    return _user;
  }

  void setUser(User user) {
    _user = user;
  }

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(
        const Duration(seconds: 3), () => _initAuthentication());
  }

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(
        const Duration(seconds: 3), () => _initAuthentication());
  }

  void _initAuthentication() async {
    if (firebaseAuth.currentUser != null) {
      _user = firebaseAuth.currentUser;
      await Get.putAsync<DashboardController>(
          () => Future.value(DashboardController()));
      Get.toNamed(RouteNames.dashboardScreen);
    } else {
      firebaseAuth.authStateChanges().listen((User? user) async {
        if (user == null) {
          Get.toNamed(RouteNames.signInScreen);
        } else {
          _user = user;
          await Get.putAsync<DashboardController>(
              () => Future.value(DashboardController()));
          isLoading.value = false;
          Get.toNamed(RouteNames.dashboardScreen);
        }
      });
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("user-not-found");
        // Get.dialog(const ErrorDialog(
        //     question: 'Log In', title1: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        print('wrong-password');
        // Get.dialog(const ErrorDialog(
        //     question: 'Log In',
        //     title1: 'Wrong password provided for that user'));
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    Get.offAllNamed(RouteNames.signInScreen);
  }
}
