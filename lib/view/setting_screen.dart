import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                cursorWidth: 0.3.w,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search settings",
                  contentPadding: EdgeInsets.only(left: 20, bottom: 1.7.h),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            InkWell(
              onTap: (){
                //Tap to see Users
              },
              child: Row(
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
            ),
            SizedBox(
              height: 4.h,
            ),
            InkWell(
              onTap: () {
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
              height: 4.h,
            ),
            InkWell(
              onTap: (){
                //Tap for Password Settings
              },
              child: Row(
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
            ),
            SizedBox(
              height: 4.h,
            ),
            InkWell(
              onTap: (){
                //Tap to LogOut
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Log out",
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
              height: 4.h,
            ),
            InkWell(
             onTap: (){
               //Tap to Delete account
             },
              child: Row(
                children: [
                  Icon(
                    Icons.delete_outline,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Delete Account",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
