import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';

class SendEmails extends StatefulWidget {
  const SendEmails({super.key});

  @override
  State<SendEmails> createState() => _SendEmailsState();
}

class _SendEmailsState extends State<SendEmails> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.only(top: 7.h,left: 4.w,right: 4.w),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back,),
                    Text(
                      'Send Emails',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 18.sp),
                    ),
                  ],
                ),


              ],
            ),

            Column(
              children: [
                apiController.getSentMailsModel?.data == null?
                Center(
                  child: Text(
                    'Nothing to show',
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                ):
                Expanded(

                  child: Obx(()=>apiController.isLoading.value?

                  Center(child: CircularProgressIndicator(),):
                      apiController.getSentMailsModel?.data==null
                      ? Center(child: Text('Nothing to show')):

                  ListView.builder(
                        itemCount: apiController.getSentMailsModel?.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 13.h,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 1.h,bottom: 1.h),
                            padding: EdgeInsets.only(left: 4.w, top: 2.5.h, right: 2.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.h),
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
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/profile_icon.png',
                                          height: 9.h,
                                          width: 9.h,
                                        ),
                                        Padding(
                                            padding:
                                            EdgeInsets.only(top: 6.h, left: 10.w),
                                            child: Image.asset(
                                              'assets/images/mail.png',
                                              height: 4.h,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 1.5.h,),
                                        Text(
                                          '${apiController.getSentMailsModel?.data?[index].recipientEmail}',
                                          style: GoogleFonts.inter(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp),
                                        ),
                                        Container(
                                          width: 60.w,
                                          // color: Colors.blue,
                                          child: Text(
                                            '${apiController.getSentMailsModel?.data?[index].senderEmail}',

                                            style: GoogleFonts.inter(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8.sp),
                                          ),
                                        ),
                                        Container(
                                          width: 60.w,
                                          // color: Colors.blue,
                                          child: Text(
                                              '${apiController.getSentMailsModel?.data?[index].subject}',

                                            style: GoogleFonts.inter(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8.sp),
                                          ),
                                        ),

                                      ],
                                    ),

                                    // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
