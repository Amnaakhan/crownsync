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
              height: 38.h,
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
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/profile_icon.png")),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Color(0xffE2545E))
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
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Icon(Icons.call,size: 20.sp,),
                      SizedBox(width: 4.w,),
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
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Icon(Icons.mail_outline_outlined,size: 20.sp,),
                      SizedBox(width: 4.w,),
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
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,size: 20.sp,),
                      SizedBox(width: 4.w,),
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
