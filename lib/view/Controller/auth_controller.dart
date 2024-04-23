import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobiledesign/home_screen.dart';
import 'package:mobiledesign/test_screen.dart';
import 'package:mobiledesign/view/inbox_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


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
        Get.to(InboxScreen());
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
  password_update({required String oldpass, required String newpass,required String cnfrmpass}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'current_password': oldpass,
        'password': newpass,
        'password_confirmation': cnfrmpass
      };
      http.Response response = await http
          .post(Uri.tryParse('https://api.crownsync.ai/api/update/password')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0NDIxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNzQwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyMjMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmog2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVzB5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2DeBDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfhjX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTEq70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy024HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dCPOdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISwpAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHsbwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YGeE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9i4NHVNzlFLeCw"
      },body: data);
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Update Password successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(HomeScreen());
      } else  {
        Fluttertoast.showToast(
            msg: 'Error , Please Try Again',

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