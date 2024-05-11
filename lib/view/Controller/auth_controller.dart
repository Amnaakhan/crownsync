import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobiledesign/view/Auth/login_screen.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:mobiledesign/view/email_preview.dart';
import 'package:mobiledesign/view/layout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Helper/helper.dart';
import '../../Model/emailmessages_model.dart';


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

  // ApiController apiController = Get.put(ApiController());

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
        Get.to(LoginScreen());

        print(response);

      } else {

        List<dynamic> errors = response['body']['errors'];
        String errorMessage = errors.join(', '); // Join error messages into a string
        Fluttertoast.showToast(
          msg: errorMessage,
          backgroundColor: Colors.black,
          textColor: Colors.white,
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
        Get.to(LayoutScreen());
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
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/update/password')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },body: data);
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Update Password successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(LayoutScreen());
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
  add_user({required String username, required String useremail}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'user_name': username,
        'user_email': useremail,
      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/adduser')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },body: data);
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'User Added successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(LayoutScreen());
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

  add_store({required String storename}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'name': storename,
      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/add-store')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
          body: data
      );
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Store Added successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(LayoutScreen());
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
  add_query({required String query}) async {
    try {
      isLoading.value = true;

      var data = {
        'query': query,
      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/admin/scop_settings')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
          body: data
      );
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Query Added successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(LayoutScreen());
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
  Future<void> deleteUser(int? userId) async {
    try {
      String? token = await AuthController().getToken();

      final response = await http.delete(
        Uri.parse('https://testapi.crownsync.ai/api/admin/scop_settings/$userId'),
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        // Handle successful deletion
        print('User deleted successfully');

      } else {
        // Handle errors
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      print('Error: $e');
    }
  }

  add_location({required String locationname}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'location': locationname,
      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/add-location')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
          body: data
      );
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Location Added successfully',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        Get.to(LayoutScreen());
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
  add_templete({required String tempname, required String heading}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value = '';
      var data = {
        'template_name': tempname,
        'heading': heading
      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/admin/mail_templates')!,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: data
      );
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Template Added successfully',
            backgroundColor: Colors.black, textColor: Colors.white
        );
        Get.to(LayoutScreen());
      } else {
        Fluttertoast.showToast(
            msg: 'Error , Please Try Again',

            backgroundColor: Colors.black, textColor: Colors.white
        );
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  edit_profile({required String name, required String phoneno,required String address}) async {
    try {
      isLoading.value = true;
      EmailPasswordError.value = '';
      var data = {
        'name': name,
        'phone': phoneno,
        'address': address
      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/update/profile')!,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: data
      );
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Profile update Sucessfully',
            backgroundColor: Colors.black, textColor: Colors.white
        );
        Get.to(LayoutScreen());
      } else {
        Fluttertoast.showToast(
            msg: 'Error , Please Try Again',

            backgroundColor: Colors.black, textColor: Colors.white
        );
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  logout() async {
    try {


      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://testapi.crownsync.ai/api/logout')!,
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
      );
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'logout Sucessfully',
            backgroundColor: Colors.black, textColor: Colors.white
        );
        Get.to(LoginScreen());
      } else {
        Fluttertoast.showToast(
            msg: 'Error , Please Try Again',

            backgroundColor: Colors.black, textColor: Colors.white
        );
      }
    } catch (e) {
      print("Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  email_preview(
      {
    required String? respondername, required String? responderemail,
    required String recivername,required String? reciveremail,
    required String? productid,   String? tempelateid,
        required String? subject, required String? location,
        required String? greeting }
      ) async {

      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'responder_mail': respondername,
        'responder_name': responderemail,
        'reciever_email': reciveremail,
        'reciever_name': recivername,
        'product_id': productid,
        'template_id': tempelateid,
        'subject' : subject,
        'location' : location,
        'greeting' : greeting

      };
      String? token = await AuthController().getToken();

      http.Response response = await http
          .post(Uri.tryParse('https://api.crownsync.ai/api/email-preview')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",},body: data);
      print("response1::$response");
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final inboxData = InboxModel.fromJson(jsonData);

        Fluttertoast.showToast(
          msg: 'Success',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );

        Get.to(EmailPreview(
          message: '',
          imageUrl: '',
        ));
      } else {
        Fluttertoast.showToast(
          msg: 'Error, Please Try Again',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      }

  }
  sendemail(
      {
        required String? recivermail, required String? responderemail,required String? message
        }
      ) async {

    isLoading.value = true;
    EmailPasswordError.value ='';
    var data = {
      'responder_mail': recivermail,
      'reply_to': responderemail,
      'response':'',
      'subject': '',
      'received_message':message,
        'from':'mobile'


    };
    String? token = await AuthController().getToken();

    http.Response response = await http
        .post(Uri.tryParse('https://api.crownsync.ai/api/gmail/send-email')!,headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    },body: data);
    print("response1::$response");
    if (response.statusCode == 200) {
      print("Response2::${response}");


      Fluttertoast.showToast(
          msg: 'Success',
          backgroundColor: Colors.black,textColor: Colors.white
      );
      Get.to(LayoutScreen());

    } else  {
      Fluttertoast.showToast(
          msg: 'Error , Please Try Again',

          backgroundColor: Colors.black,
          textColor: Colors.white
      );
    }

  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
// Dear  thezubairkhan.developer@gmail.com,\n\nMy name is Amna khan.'
// '  I am one of the Rolex Specialists here at Hamra Jewelers.  Hamra Jewelers has '
// 'been an Official Rolex Jeweler for over 20 years and we welcome the opportunity '
// 'to assist you.\nThank you for inquiring about the Rolex Rolex 1908 39 mm, 18 ct '
// 'white gold, polished finish, M52509-0006\n\nWhat a fantastic timepiece!  This watch'
// ' combines many of the features that has secured Rolex’s position as the premier brand'
// ' in the timepiece industry.  It features .  Additionally, the Rolex 1908 39 mm, 18 ct'
// ' white gold, polished finish, M52509-0006, like all Rolex watches, are entirely Swiss'
// ' Made, highly waterproof, come with 5-year warranties, and are amongst the most reliable'
// ' and durable watches in the world.\nCurrently I do have a  Rolex 1908 39 mm, 18 ct white'
// ' gold, polished finish, M52509-0006  in stock Please let me know if you are interested '
// 'in viewing the Rolex 1908 39 mm, 18 ct white gold, polished finish, M52509-0006 and I '
// 'would be happy to make an appointment with you.  Please note all Rolex sales are in store, '
// 'over the counter.  I can be reached at [SenderPhone]. \nThank you again for your inquiry '
// 'and your interest in Rolex.\nI hope you have a wonderful day and I look forward to assisting'
// ' you with all your timepiece needs.\n\n\nBest,\nAmna khan\nZubair khan\nGeneva