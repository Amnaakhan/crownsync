import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h,),
            SizedBox(
              height: 30.h,
              width: double.infinity,
              child: Card(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back,size: 20,weight: 2,),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.mode_edit_outlined,size: 20,weight: 2,),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white, // Choose the background color of the border
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffE2545E), // Choose the border color
                          width: 2, // Choose the border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 35.sp,
                        backgroundImage: AssetImage("assets/images/profile_icon.png"),
                      ),
                    ),
                    Text(
                      "Kachi UI",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(5.w,8.h,5.w,0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.call,size: 20.sp,),
                      SizedBox(width: 5.w,),
                      Text(
                        "+44 1234 567 8910",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Icon(Icons.mail_outline_outlined,size: 20.sp,),
                      SizedBox(width: 5.w,),
                      Text(
                        "kachiui909@gmail.com",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,size: 20.sp,),
                      SizedBox(width: 5.w,),
                      Text(
                        "DC Washington",
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
          ],
        ),
      ),
    );
  }
}
