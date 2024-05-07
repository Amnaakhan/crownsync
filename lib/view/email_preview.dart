import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';

class EmailPreview extends StatefulWidget {
  final String? message;
  final String? imageUrl;

  const EmailPreview({super.key, this.message, this.imageUrl});

  @override
  State<EmailPreview> createState() => _EmailPreviewState();
}

class _EmailPreviewState extends State<EmailPreview> {
  ApiController apiController = Get.put(ApiController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
body:

   Column(
      children: [
        Container(
          height: 18.h,
          width: double.infinity,
          color: Colors.white,
          padding:  EdgeInsets.only(top: 7.h,left: 4.w,right: 4.w),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back,)),
                      Text(
                        'EmailPreview',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  Spacer(),


                ],
              ),
              SizedBox(height: 2.h,),

            ],
          ),
        ),
        SizedBox(height: 2.h,),
        Container(height: 62.h,
          width: double.infinity,
          margin: EdgeInsets.only(left: 2.w,right: 2.w),
          padding: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),

          decoration: BoxDecoration(
            color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.10),
                  blurRadius: 4, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    0, // Move to right 10  horizontally
                    4, // Move to bottom 10 Vertically
                  ),
                )
              ],
            borderRadius: BorderRadius.circular(1.h)

          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.message}'
                ,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 10.sp),),

                SizedBox(height: 2.h,),
            Image.asset('assets/images/img1.png'),
                SizedBox(height: 2.h,),










              ],
            ),
          ),
          ),
        SizedBox(height: 2.h,),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
authController.sendemail(recivermail: '', responderemail: 'khanaman983@gmail.com', message: '');
              },
              child: Container(
                height: 7.h,
              width: double.infinity,
                margin: EdgeInsets.only(left: 5.w,right: 5.w),
                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                  borderRadius: BorderRadius.circular(4.h)
                ),
                child: Center(
                  child: Text(
                    'Send',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,

                          fontSize: 20.sp)
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h,)
      ],
    ),


    );
  }
}
