import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledesign/view/Controller/auth_controller.dart';



class Helpers{
  static const String base_api = 'https://api.crownsync.ai/api/';

  static Map<String, String> withTokenHeaders({bool isformdata = false}) {


    AuthController authController = Get.put(AuthController());
    return {
      "Accept": "application/json",
      "Content-Type": isformdata
          ? "multipart/form-data"
          : "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${authController.userToken.value}",
    };
  }

  static const Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
  };
  static navigate(context, widget) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static post({
    required String url,
    required Map<String, dynamic> data,
    bool is_protected = false,
  }) async {
    try {
      final response = await http.post(Uri.parse(base_api + url),
          headers: is_protected ? withTokenHeaders() : headers, body: data);

      Map<String, dynamic> allData = {
        'body': jsonDecode(response.body),
        'statusCode': response.statusCode,
      };

      return allData;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }
  AuthController authController = Get.put(AuthController());
  static get({
    required String url,
    bool is_protected = false,
  }) async {
    try {
      final response = await http.get(Uri.parse(base_api + url),
          headers: is_protected ? withTokenHeaders() : headers);

      Map<String, dynamic> allData = {
        'body': jsonDecode(response.body),
        'statusCode': response.statusCode,
      };

      return allData;
    } catch (e, s) {
      print("Error" + e.toString());
      rethrow;
    }
  }

}