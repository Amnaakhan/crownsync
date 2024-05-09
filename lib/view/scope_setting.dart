import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ScopeSetting extends StatefulWidget {
  const ScopeSetting({super.key});

  @override
  State<ScopeSetting> createState() => _ScopeSettingState();
}

class _ScopeSettingState extends State<ScopeSetting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   body: Column(
     children: [
       Container(
         height: 15.h,
         width: double.infinity,
         color: Colors.white,
         padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
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
                       child: Icon(
                         Icons.arrow_back,
                       ),
                     ),
                     Text(
                       'Scope Setting',
                       style: GoogleFonts.inter(
                           fontWeight: FontWeight.w500, fontSize: 18.sp),
                     ),
                   ],
                 ),
                 Spacer(),
                 Padding(
                   padding: EdgeInsets.only(top: 2.h),
                     child: Image.asset("assets/images/logo1.png",height: 3.h,))
               ],
             ),
           ],
         ),
       ),
       SizedBox(height: 5.h,)


     ],
   ),
    );
  }
}
