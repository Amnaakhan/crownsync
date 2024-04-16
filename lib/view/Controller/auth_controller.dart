import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobiledesign/home_screen.dart';
import 'package:mobiledesign/test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/helper.dart';

class AuthController extends GetxController{
  var userId = null;
  var isLoggedIn = null;
  var isPayment = null;
  var userEmail = ''.obs;
  var EmailVerify = "";
  var userToken = ''.obs;
  String ErrorEmail = '';
  String ErrorPhone = '';
  var emailError = "".obs;
  var phoneError = "".obs;
  var isLoading = false.obs;
  var isloader = false.obs;
  var passwordError = ''.obs;
  var ResetpasswordConfirmationError = ''.obs;
  var EmailPasswordError = ''.obs;
  var Name = ''.obs;
  var userrole = ''.obs;
  // Rx<User?> user = Rx(null);


  register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emailError.value = '';
      passwordError.value = '';
      isLoading.value = true;
      Map<String, String> data = {
        'name': name,
        'email': email,
        'password': password,
      };
      final response = await Helpers.post(url: 'register', data: data);
      print("Response::$response");
      if (response['statusCode'] == 200) {
        Fluttertoast.showToast(
          msg: 'Register Sucessfully',

            backgroundColor: Colors.black,textColor: Colors.white
        );
        print(response);

      } else {
        // userEmail.value = response['body']['email'];
        // this.send_verification_code(email: userEmail.value);
        // Get.to(
        //       () => VerifyEmail(phone: phone,
        //     // text: userEmail.value,
        //   ),
        //   transition: Transition.fade,
        //   duration: Duration(
        //     milliseconds: 600,
        //   ),
        // );
        Fluttertoast.showToast(
          msg: response['body']['errors'],

            backgroundColor: Colors.black,textColor: Colors.white
        );
        print(response);
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'email': email,
        'password': password,
      };
      final response = await Helpers.post(url: 'login', data: data);
      print("response1::$response");
      if (response['statusCode'] == 200) {
        print("Response2::${response}");
        print("Before Token: ${response['body']['token']}");

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['body']['token']);
        print("After Token: ${response['body']['token']}");

        Fluttertoast.showToast(
            msg: 'Logged In successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(HomeScreen());
      } else  {
        Fluttertoast.showToast(
          msg: response['body']['message'],

          backgroundColor: Colors.black,textColor: Colors.white
        );
      }
    }catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}