import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DetailEmailScreen extends StatefulWidget {
  const DetailEmailScreen({super.key});

  @override
  State<DetailEmailScreen> createState() => _DetailEmailScreenState();
}

class _DetailEmailScreenState extends State<DetailEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 7.h,left: 4.w,right: 4.w),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back,),
                    Text(
                      'Details',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 18.sp),
                    ),
                  ],
                ),
                Spacer(),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
