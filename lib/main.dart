import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiledesign/home_screen.dart';
import 'package:mobiledesign/view/Auth/register_screen.dart';
import 'package:mobiledesign/view/dashboard.dart';
import 'package:mobiledesign/view/inbox_screen.dart';
import 'package:mobiledesign/view/profile_screen.dart';
import 'package:mobiledesign/view/setting_screen.dart';
import 'package:sizer/sizer.dart';

import 'view/Auth/login_screen.dart';

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
          home: SettingScreen()
        );
      },
    );
  }
}

