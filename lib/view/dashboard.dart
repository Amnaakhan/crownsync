import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/home_screen.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xffE2545E),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5.w, 7.h, 0.w, 0.h),
                      child: Container(
                        height: 7.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/profile_icon.png")),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: const Color(0xffE2545E))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2.w, 7.h, 0.w, 0.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${apiController.profileModel?.data?.name}",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${apiController.profileModel?.data?.email}",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 21.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 45.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xffEAE5F5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Connected\nAccounts",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "5",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 45.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xffE0E9F5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Sent",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "10",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 45.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xffF3E3E3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Messages",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "15",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 45.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xffF3E3E3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Assigned",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 10.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "20",
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Container(
                  height: 7.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Color(0xffE2545E),
                      borderRadius: BorderRadius.circular(24.h)),
                  child: Center(
                      child: Image.asset(
                        "assets/images/add-user.png",
                        color: Colors.white,
                        height: 3.5.h,
                        width: 8.w,
                      )),
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}