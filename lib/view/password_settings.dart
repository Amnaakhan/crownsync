import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class PasswordSettings extends StatefulWidget {
  const PasswordSettings({super.key});

  @override
  State<PasswordSettings> createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
  final passwordController = TextEditingController();
  final cnfrmpasswordController = TextEditingController();
  final newpassword = TextEditingController();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      "Password Settings",
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
controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          labelText: "Old Password",
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
                        controller: newpassword,
                        cursorColor:Color(0xff00233D),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          labelText: "New Password",
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
                        controller: cnfrmpasswordController,
                        cursorColor: Color(0xff00233D),

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          labelText: "Confirm Password",
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
                      SizedBox(height: 10.h,),
                      Obx(()=>authController.isLoading.value?Center(child: CircularProgressIndicator(),):
                   InkWell(

                            onTap: (){
                              if (passwordController.text.isEmpty) {
                                Get.snackbar("Error", "Please Enter your email",
                                    backgroundColor:
                                    Colors.black,
                                    colorText: Colors.white,

                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: EdgeInsets.only(
                                        bottom: 8.h, left: 5.w, right: 5.w));
                              } else if(cnfrmpasswordController.text.isEmpty){
                                Get.snackbar("Error", "Please Enter your password",
                                    backgroundColor:
                                    Colors.black,
                                    colorText: Colors.white,

                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: EdgeInsets.only(
                                        bottom: 8.h, left: 5.w, right: 5.w));
                              }
                              else if(newpassword.text.isEmpty){
                                Get.snackbar("Error", "Please Enter your password",
                                    backgroundColor:
                                    Colors.black,
                                    colorText: Colors.white,

                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: EdgeInsets.only(
                                        bottom: 8.h, left: 5.w, right: 5.w));
                              }else{
                        authController.password_update(oldpass: passwordController.text, newpass: newpassword.text,
                            cnfrmpass: cnfrmpasswordController.text);
                              }
                            },
                            //Tap to update password

                          child: Container(
                            height: 7.h,
                            width: double.infinity,

                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)

                            ),
                            child: Center(child: Text('Update',style: GoogleFonts.inter(color: Colors.white, fontSize: 15.sp))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
