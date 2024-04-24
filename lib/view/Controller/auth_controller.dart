import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobiledesign/home_screen.dart';
import 'package:mobiledesign/test_screen.dart';
import 'package:mobiledesign/view/email_preview.dart';
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


  email_preview(
      {
    required String? respondername, required String? responderemail,
    required String recivername,required String? reciveremail,
    required String? productid,   String? tempelateid}
      ) async {

      isLoading.value = true;
      EmailPasswordError.value ='';
      var data = {
        'responder_mail': respondername,
        'responder_name': responderemail,
        'reciever_email': reciveremail,
        'reciever_name': recivername,
        'product_id': productid,
        'template_id': tempelateid

      };
      http.Response response = await http
          .post(Uri.tryParse('https://api.crownsync.ai/api/email-preview')!,headers: {
        "Accept": "application/json",
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjBiYjViY2FjOTM5MzEzNjI2MDlmYmYzZGYwYzA4ZGE5ZDFjNTRjMDgyNzY3ZTAzOWIyZjdkNzlhMDgzYjU4OTEzMjYxMjg5NWJjOTI4ZjgiLCJpYXQiOjE3MTM5MzU0MjIuMDgyNzgsIm5iZiI6MTcxMzkzNTQyMi4wODI3ODIsImV4cCI6MTc0NTQ3MTQyMi4wODIwMjQsInN1YiI6IjI1Iiwic2NvcGVzIjpbXX0.L0ypgsJFChQDmFq9Vr6w3DgxyXEGiSedTQHPokyp8aMgTj7uKMOce3aMvJ0bRsRFUHR0m284VVVjUpqL15JYdVw6YuNA13_RfmvtihDRs9LaxM9g-ZIz_avrxd-QGJ000zisk63vG_NegXBRgVp8jsp2DiG_D3YdNAs4e1wQKGlYoQyYNifS21w4hY2g7_qhZi_wJa28RdpKdWqgYefJ-vHEMgicnRuNTfXWkWwzWM-rr_cZLwhib7tQRXA9oTBLSRq8tkqP1u0vxy5s1w6CqBtVdiyJ-fGMTCBOXCpB2oMFUOJipxMVDu6vSmFiBWGJQ6XLZ3KXZxs_2qXTjCj3pYC2vEf8MSFKmOMze4ZP11md2HpEzBmeAqbtVxTmbBPN8nXovzdXcz_Ma35d-P49qvZZ-By0kVa3utmSTqcsLG7iYZfJe7OKJ7nSUI3R5kjQ0fMZ_hfLJOtqcb-1NauNlh-qvuNeiPfQw40m3BChSsmlXzoMTHpPuWIr2M-Mp4omUdnGJ0SOvzL9UxCWmnBTRv0jOIW5FcewScqsYbkiWXzplTws_43pY26U4MbdqteQ5t7UwONCbQA_8WKwzeWzu4LEdjMj1pS3vFy3HzY8EreFSTV6VMa7oj7Go57lccmKGSNFx74CV0CKSFCZ5RJPG0bdpMB4XQLZXTQrE30XLwA"
      },body: data);
      print("response1::$response");
      if (response.statusCode == 200) {
        print("Response2::${response}");


        Fluttertoast.showToast(
            msg: 'Success',
            backgroundColor: Colors.black,textColor: Colors.white
        );
        print("Email preview::${response}");

        Get.to(EmailPreview(responseBody: response.body,));
      } else  {
        Fluttertoast.showToast(
            msg: 'Error , Please Try Again',

            backgroundColor: Colors.black,textColor: Colors.white
        );
      }

  }
  sendemail(
      // {
      //   // required String? recivermail, required String? responderemail,
      //   }
      ) async {

    isLoading.value = true;
    EmailPasswordError.value ='';
    var data = {
      'responder_mail': 'khanamna983@gmail.com',
      'reply_to': 'thezubairkhan.developer@gmail.com',
      'response':'',
      'subject': '',
      'received_message':'Dear  thezubairkhan.developer@gmail.com,\n\nMy name is Amna khan.'
          '  I am one of the Rolex Specialists here at Hamra Jewelers.  Hamra Jewelers has '
          'been an Official Rolex Jeweler for over 20 years and we welcome the opportunity '
          'to assist you.\nThank you for inquiring about the Rolex Rolex 1908 39 mm, 18 ct '
          'white gold, polished finish, M52509-0006\n\nWhat a fantastic timepiece!  This watch'
          ' combines many of the features that has secured Rolex’s position as the premier brand'
          ' in the timepiece industry.  It features .  Additionally, the Rolex 1908 39 mm, 18 ct'
          ' white gold, polished finish, M52509-0006, like all Rolex watches, are entirely Swiss'
          ' Made, highly waterproof, come with 5-year warranties, and are amongst the most reliable'
          ' and durable watches in the world.\nCurrently I do have a  Rolex 1908 39 mm, 18 ct white'
          ' gold, polished finish, M52509-0006  in stock Please let me know if you are interested '
          'in viewing the Rolex 1908 39 mm, 18 ct white gold, polished finish, M52509-0006 and I '
          'would be happy to make an appointment with you.  Please note all Rolex sales are in store, '
          'over the counter.  I can be reached at [SenderPhone]. \nThank you again for your inquiry '
          'and your interest in Rolex.\nI hope you have a wonderful day and I look forward to assisting'
          ' you with all your timepiece needs.\n\n\nBest,\nAmna khan\nZubair khan\nGeneva',
        'from':'mobile'


    };
    http.Response response = await http
        .post(Uri.tryParse('https://api.crownsync.ai/api/gmail/send-email')!,headers: {
      "Accept": "application/json",
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
          ".eyJhdWQiOiIzIiwianRpIjoiZjBiYjViY2FjOTM5MzEzNjI2MDlmYmYzZGYwYz"
          "A4ZGE5ZDFjNTRjMDgyNzY3ZTAzOWIyZjdkNzlhMDgzYjU4OTEzMjYxMjg5NWJj"
          "OTI4ZjgiLCJpYXQiOjE3MTM5MzU0MjIuMDgyNzgsIm5iZiI6MTcxMzkzNTQyMi"
          "4wODI3ODIsImV4cCI6MTc0NTQ3MTQyMi4wODIwMjQsInN1YiI6IjI1Iiwic2Nv"
          "cGVzIjpbXX0.L0ypgsJFChQDmFq9Vr6w3DgxyXEGiSedTQHPokyp8aMgTj7uKMOc"
          "e3aMvJ0bRsRFUHR0m284VVVjUpqL15JYdVw6YuNA13_RfmvtihDRs9LaxM9g-ZIz"
          "_avrxd-QGJ000zisk63vG_NegXBRgVp8jsp2DiG_D3YdNAs4e1wQKGlYoQyYNifS2"
          "1w4hY2g7_qhZi_wJa28RdpKdWqgYefJ-vHEMgicnRuNTfXWkWwzWM-rr_cZLwhib7"
          "tQRXA9oTBLSRq8tkqP1u0vxy5s1w6CqBtVdiyJ-fGMTCBOXCpB2oMFUOJipxMVDu6"
          "vSmFiBWGJQ6XLZ3KXZxs_2qXTjCj3pYC2vEf8MSFKmOMze4ZP11md2HpEzBmeAqbtVx"
          "TmbBPN8nXovzdXcz_Ma35d-P49qvZZ-By0kVa3utmSTqcsLG7iYZfJe7OKJ7nSUI3R5k"
          "jQ0fMZ_hfLJOtqcb-1NauNlh-qvuNeiPfQw40m3BChSsmlXzoMTHpPuWIr2M-Mp4omUdn"
          "GJ0SOvzL9UxCWmnBTRv0jOIW5FcewScqsYbkiWXzplTws_43pY26U4MbdqteQ5t7UwONCb"
          "QA_8WKwzeWzu4LEdjMj1pS3vFy3HzY8EreFSTV6VMa7oj7Go57lccmKGSNFx74CV0CKSFCZ"
          "5RJPG0bdpMB4XQLZXTQrE30XLwA"
    },body: data);
    print("response1::$response");
    if (response.statusCode == 200) {
      print("Response2::${response}");


      Fluttertoast.showToast(
          msg: 'Success',
          backgroundColor: Colors.black,textColor: Colors.white
      );

    } else  {
      Fluttertoast.showToast(
          msg: 'Error , Please Try Again',

          backgroundColor: Colors.black,textColor: Colors.white
      );
    }

  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}