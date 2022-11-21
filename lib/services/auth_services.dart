import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthService extends ChangeNotifier {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();
  // ignore: prefer_final_fields
  void signIn({required String userName, required String password}) async {}
  final client = Dio();

  Future<void> getData() async {
    const url = 'https://clinical-management-nmcnpm.herokuapp.com/user';
    try {
      final response = await client.get(url);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
