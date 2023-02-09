import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:komik_store/Models/usermodel.dart';
import 'package:komik_store/routes/routes.dart';

class AuthController extends GetxController {
  var token = ''.obs;
  final emailC = TextEditingController();
  final emailCR = TextEditingController();
  final passwordC = TextEditingController();
  final passwordCR = TextEditingController();
  final nameC = TextEditingController();
  final url = 'http://10.0.2.2:8000/users/';
  final storage = const FlutterSecureStorage();
  var userData = UserModel(name: '', email: '').obs;
  var dio = Dio();
  @override
  void onInit() {
    getToken();
    Timer(const Duration(seconds: 3), () {
      if (token.isEmpty) {
        Get.offNamed(Routes.login);
      } else {
        getUser();
        Get.offNamed(Routes.navbar);
      }
    });

    super.onInit();
  }

  Future<void> login() async {
    try {
      var response = await dio.post('${url}login',
          data: {'email': emailC.text, 'password': passwordC.text});
      String dataToken = response.data['data']['token'];
      await storage.write(key: 'token', value: dataToken);
      token.value = dataToken;

      if (response.data['status'] == true) {
        getUser();
        Get.offNamed(Routes.navbar);
      } else {
        Get.snackbar(
          'User tidak ditemukan',
          'Password atau email salah',
        );
      }
    } catch (e) {
      Get.snackbar(
        'User tidak ditemukan',
        'Password atau email salah',
      );
    }
  }

  Future<void> register() async {
    try {
      var response = await dio.post('${url}register', data: {
        'name': nameC.text,
        'email': emailCR.text,
        'password': passwordCR.text
      });
      if (response.statusCode == 200) {
        Get.offNamed(Routes.login);
      } else {
        Get.snackbar('Error', 'Somethink Wrong');
      }
    } catch (e) {
      Get.snackbar('Error', 'Somethink Wrong');
    }
  }

  void deleteToken() async {
    await storage.delete(key: 'token');
    token.value = '';
  }

  void getToken() async {
    token.value = await storage.read(key: 'token') ?? '';
  }

  Future<Rx<UserModel>> getUser() async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    try {
      var response = await dio.get('${url}me');
      Map<String, dynamic> data = response.data['data'];
      userData.value = UserModel.fromJson(data);

      return userData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
