import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 9,
                      offset: Offset(0, 1), // Apply shadow only to bottom
                    ),
                  ],
                ),
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.3,
                                      blurRadius: 9,
                                      offset: Offset(0, 1), // Apply shadow only to bottom
                                    ),
                                  ],

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back,size: 20,weight: 5,),
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.3,
                                    blurRadius: 9,
                                    offset: Offset(0, 1), // Apply shadow only to bottom
                                  ),
                                ],

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
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
                          color: Colors.cyan, // Choose the border color
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 27.sp,
                        backgroundImage: AssetImage("assets/images/profile_icon.png"),
                      ),
                    ),
                    Text(
                      "${apiController.profileModel?.data?.name}",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rides Completed: 150",
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.masks,size: 15,color: Colors.blue,)
                      ],
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
                      Image.asset("assets/images/telephone.png",height: 5.h,width: 5.w,color: Colors.black,),
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
                      Icon(Icons.mail_outline_outlined,size: 16.sp,),
                      SizedBox(width: 5.w,),
                      Text(
                        "${apiController.profileModel?.data?.email}",
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
