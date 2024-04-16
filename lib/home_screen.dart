import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/inbox_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  AuthController authController = Get.put(AuthController());


  late GoogleSignIn _googleSignIn;

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(
      scopes:
      ['https://www.googleapis.com/auth/userinfo.email',
        'https://mail.google.com/',
        // 'https://www.googleapis.com/auth/gmail.readonly'
      ],


      serverClientId:
      '371366179768-olq6fq6do1lg8eqcuv99qjev930k19lm.apps.googleusercontent.com',
      // clientId: '371366179768-jqqtha822p8ctdcb7h3d1ivgo26l5ns6.apps.googleusercontent.com',
// hostedDomain: 'crownsync.ai',
//     signInOption: SignInOption.standard
    );
  }

  void googleSignIn() async {
    try {
      GoogleSignInAccount? result = await _googleSignIn.signIn();

      print('result = $result');


      // Proceed with the sign-in process since result is not null
      GoogleSignInAuthentication googleAuth = await result!.authentication;
      print('result === $result');
      var data = {'usertoken': googleAuth.accessToken};
      String jsonEncoded = jsonEncode(data);
      print('token == ${googleAuth.accessToken}');
      String? token = await AuthController().getToken();
      print('usertoken $token');
      var response = await http.post(
        Uri.parse('https://api.crownsync.ai/api/auth/google'),
        body: jsonEncoded,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Use this if you have an additional token from your AuthController
        },
      );

      if (response.statusCode == 200) {
        print('Success');
        Get.to(() => InboxScreen()); // Using GetX for navigation
      } else {
        print('HTTP error: ${response.statusCode}');
        // Log or handle the error message from the response body
        print('Error details: ${response.body}');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      // Error dialogue

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            googleSignIn();
          },
          child: Container(
            height: 7.h,
            width: double.infinity,
            margin: EdgeInsets.only(left: 5.w, right: 5.w),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(4.h)),
            child: Center(
              child: Text('Connect with google',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp)),
            ),
          ),
        ),
      ),
    );
  }
}
