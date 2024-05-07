
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/add_location.dart';
import 'package:mobiledesign/view/add_store.dart';
import 'package:mobiledesign/view/edit_profile.dart';
import 'package:sizer/sizer.dart';

import 'Controller/getcontroller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 0.3,
                              blurRadius: 9,
                              offset: const Offset(
                                  0, 1), // Apply shadow only to bottom
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          String.fromCharCode(Icons.arrow_back.codePoint),
                          style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w500, // Increase font weight
                            fontFamily: Icons.arrow_back.fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Profile",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
onTap: (){
  Get.to(EditProfile());
},

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 0.3,
                              blurRadius: 9,
                              offset: const Offset(
                                  0, 1), // Apply shadow only to bottom
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(
                                0.7), // Change the opacity value to adjust the shade
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            "assets/images/highlighter.png",
                            height: 3.h,
                            width: 6.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 2.h),
            child: SizedBox(
              height: 20.h,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 18,
                      offset:
                      const Offset(0, 20), // Apply shadow only to bottom
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Choose the background color of the border
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.cyan, // Choose the border color
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 27.sp,
                        backgroundImage:
                        const AssetImage("assets/images/profile_icon.png"),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "${apiController.profileModel?.data?.name}",

                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Orders Completed: 150",
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/images/silver-medal.png",
                            height: 2.h,
                            width: 4.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w, right: 7.w),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/telephone.png",
                      height: 3.h,
                      width: 6.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${apiController.profileModel?.data?.phone}",

                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      String.fromCharCode(
                          Icons.mail_outline_outlined.codePoint),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 25,
                        fontWeight: FontWeight.w100, // Increase font weight
                        fontFamily: Icons.mail_outline_outlined.fontFamily,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${apiController.profileModel?.data?.email}",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      String.fromCharCode(Icons.location_on_outlined.codePoint),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 25,
                        fontWeight: FontWeight.w100, // Increase font weight
                        fontFamily: Icons.location_on_outlined.fontFamily,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "DC Washington",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 17.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.06),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 7.w, right: 7.w, top: 3.3.h, bottom: 3.3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/close.png",
                        height: 3.h,
                        width: 6.w,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Log out",
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/trash-can.png",
                        height: 3.h,
                        width: 6.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Delete Account",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
      SizedBox(height: 2.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: (){
              Get.to(AddStore());
            },
            child: Container(
              height: 5.h,
              width: 25.w,
              decoration: BoxDecoration(
                  color: Color(0xffE2545E),
                  borderRadius: BorderRadius.circular(20.h)),
              child: Center(
                  child: Text('Store',
                      style: GoogleFonts.inter(
                          color: Colors.white, fontSize: 12.sp))),
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(AddLocation());
            },
            child: Container(
              height: 5.h,
              width: 25.w,
              decoration: BoxDecoration(
                  color: Color(0xffE2545E),
                  borderRadius: BorderRadius.circular(20.h)),
              child: Center(
                  child: Text('Location',
                      style: GoogleFonts.inter(
                          color: Colors.white, fontSize: 12.sp))),
            ),
          ),
        ],
      )
        ],
      ),
    );
  }
}