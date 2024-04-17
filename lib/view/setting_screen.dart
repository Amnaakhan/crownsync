import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/profile_screen.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/profile_icon.png")),
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Color(0xffE2545E))),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Setttings",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.build_circle_outlined,
                size: 22.sp,
                weight: 2,
              ),
            ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox.expand(
          child: ListView(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.supervised_user_circle_sharp,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Users/Team",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: (){
                  Get.to(ProfileScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "Profile",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.password_outlined,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Password Settings",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
