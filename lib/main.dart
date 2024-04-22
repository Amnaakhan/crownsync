import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiledesign/view/Auth/login_screen.dart';
import 'package:mobiledesign/view/details_screen.dart';
import 'package:mobiledesign/view/dropDownExample.dart';
import 'package:mobiledesign/view/inbox_screen.dart';
import 'package:mobiledesign/view/send_emails.dart';
import 'package:sizer/sizer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: DetailsScreen()
        );
      },
    );
  }
}

