import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/home_screen.dart';
import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("DashBoard",style: GoogleFonts.inter(color: Colors.black, fontSize: 18.sp,fontWeight: FontWeight.bold,),),
          Image.asset("assets/images/logo1.png",height: 11.h,width: 11.w,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(  height: 20.h,
                  width: 45.w,
                  child: Card(
                    color: Color(0xffEAE5F5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Connected\nAccounts",style: GoogleFonts.inter(color: Colors.black, fontSize: 10.sp,),),
                        SizedBox(height: 1.h,),
                        Text("5",style: GoogleFonts.inter(color: Colors.black, fontSize: 22.sp,fontWeight:FontWeight.w600),),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                  width: 45.w,
                  child: Card(
                    color: Color(0xffE0E9F5),
                    child: Center(child: Text("Sent",style: GoogleFonts.inter(color: Colors.black, fontSize: 12.sp,),)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                SizedBox(
                  height: 20.h,
                  width: 45.w,
                  child: Card(
color: Color(0xffF3E3E3),
                    child: Center(child: Text("Messages",style: GoogleFonts.inter(color: Colors.black, fontSize: 12.sp,),)),
                  ),
                ),
                SizedBox(  height: 20.h,
                  width: 45.w,
                  child: Card(
                    color: Color(0xffF3E3E3),
                    child: Center(child: Text("Assigned",style: GoogleFonts.inter(color: Colors.black, fontSize: 12.sp,),)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
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
                    borderRadius: BorderRadius.circular(24.h)

                ),
                child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30,color: Colors.white),
                )),
              ),
            ),
            SizedBox(width: 30,),

          ],
        ),
      ),
    );
  }
}
