import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final username = TextEditingController();
  final useremail = TextEditingController();
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(
        height: 5.h,
      ),
      Row(
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
            "Add User in the team",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Padding(
        padding:
        EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h, bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              child: Image.asset("assets/images/logo1.png"),
            ),
            SizedBox(
              height: 6.h,
            ),                      TextFormField(
              cursorColor: Color(0xff00233D),
              controller: username,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.h),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(1.h),
                ),
                labelText: "User Name",
                contentPadding: EdgeInsets.only(left: 5.w),
                labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                floatingLabelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                alignLabelWithHint: true,

                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                fillColor: Colors.transparent,
                floatingLabelBehavior: FloatingLabelBehavior.always, // Set the label behavior
              ),
            ),
            SizedBox(height: 3.h,),

            TextFormField(
              controller: useremail,
              cursorColor:Color(0xff00233D),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.h),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(1.h),
                ),
                labelText: "User Email",
                contentPadding: EdgeInsets.only(left: 5.w),
                labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                floatingLabelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                alignLabelWithHint: true,

                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                fillColor: Colors.transparent,
                floatingLabelBehavior: FloatingLabelBehavior.always, // Set the label behavior
              ),
            ),
            SizedBox(height: 3.h,),

            InkWell(

              onTap: (){
                if (username.text.isEmpty) {
                  Get.snackbar("Error", "Please Enter User Name",
                      backgroundColor:
                      Colors.black,
                      colorText: Colors.white,

                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.only(
                          bottom: 8.h, left: 5.w, right: 5.w));
                } else if(useremail.text.isEmpty){
                  Get.snackbar("Error", "Please Enter user Email",
                      backgroundColor:
                      Colors.black,
                      colorText: Colors.white,

                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.only(
                          bottom: 8.h, left: 5.w, right: 5.w));
                }
               else{
  authController.add_user(username: username.text, useremail: useremail.text);
                }
              },


              child: Container(
                height: 7.h,
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                    borderRadius: BorderRadius.circular(24.h)

                ),
                child: Center(child: Text('Add User',style: GoogleFonts.inter(color: Colors.white, fontSize: 15.sp))),
              ),
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


