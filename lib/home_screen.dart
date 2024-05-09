import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';


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
      ],


      serverClientId:
      '341429096489-e24lk8sq54ku9blm9o68v558pqces2mo.apps.googleusercontent.com',
      // clientId: '371366179768-jqqtha822p8ctdcb7h3d1ivgo26l5ns6.apps.googleusercontent.com',
      // forceCodeForRefreshToken: true,


    );

  }

  void googleSignIn() async {
    try {
      GoogleSignInAccount? result = await _googleSignIn.signIn();

      // print('result = $result');


      // Proceed with the sign-in process since result is not null
      GoogleSignInAuthentication googleAuth = await result!.authentication;
      print(''
          'Auth code ${result.serverAuthCode}');
      print('result === $result');
      var data = {'usertoken': googleAuth.accessToken};

      String jsonEncoded = jsonEncode(data);
      print('token == ${googleAuth.accessToken}');
      print('id token == ${googleAuth.idToken}');

      String? token = await AuthController().getToken();

      var response = await http.post(
        Uri.parse('https://testapi.crownsync.ai/api/auth/google'),
        body: jsonEncoded,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      // print('body $token');
      if (response.statusCode == 200) {
        print('Success');
        Get.to(() => LayoutScreen()); // Using GetX for navigation
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                googleSignIn();
                // _launchUrlPrivacy();
                    print('');
              },

              child: Container(
                height: 7.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffE2545E), // Change this to your desired border color
                      width: 1, // Change the width of the border if needed
                    ),
                     borderRadius: BorderRadius.circular(4.h)),
                child: Center(
                  child: Text('Connect with Google',
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp)),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            height: 7.h,
            width: double.infinity,
            margin: EdgeInsets.only(left: 5.w, right: 5.w),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffE2545E), // Change this to your desired border color
                  width: 1, // Change the width of the border if needed
                ),

                borderRadius: BorderRadius.circular(4.h)),
            child: Center(
              child: Text('Connect with Facebook',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp)),
            ),
          ),
        ],
      ),
    );
  }
  final Uri _urlPrivacy = Uri.parse('https://testapi.crownsync.ai/auth/redirect?userId=47');
  Future<void> _launchUrlPrivacy() async {
    if (!await launchUrl(_urlPrivacy)) {
      throw Exception('Could not launch $_urlPrivacy');
    }
  }
}

