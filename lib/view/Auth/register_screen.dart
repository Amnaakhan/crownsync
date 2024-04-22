import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Auth/login_screen.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15.h,left: 7.w,right: 7.w),
          child: Column(
            children: [
              Center(child: Image.asset('assets/images/logo1.png',height: 11.h,)),
              SizedBox(height: 7.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Sign Up',    style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 20.sp),),
              ),
              SizedBox(height: 1.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Please enter your details to create your free account.',    style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 13.sp),),
              ),
              SizedBox(height: 3.h,),

              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  labelText: "Full Name",
                  contentPadding: EdgeInsets.only(left: 5.w),
                  labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                  floatingLabelStyle: TextStyle(color: Color(0xff00233D)),
                  alignLabelWithHint: true,
                  filled: true,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: Colors.transparent,
                  floatingLabelBehavior: FloatingLabelBehavior.always, // Set the label behavior
                ),
              ),

              SizedBox(height: 3.h,),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  labelText: "Email",
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
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  labelText: "Password",
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_box),
                  SizedBox(width: 2.w,),
                  Wrap(
                    children: [
                      Text('I agree to the ',style: GoogleFonts.inter(color: Color(0xff00233D), fontSize: 10.sp),),
                      Text('Terms & condition',style: GoogleFonts.inter(color: Colors.blue,fontSize: 10.sp))

                    ],
                  )
                ],),
              SizedBox(height: 3.h,),

              Obx(()=>authController.isLoading.value?Center(child: CircularProgressIndicator(),):
                 InkWell(
                  onTap: (){
                    if (nameController.text.isEmpty) {
                      Get.snackbar("Error", "Please Enter your name",
                          backgroundColor:
                          Colors.black,
                          colorText: Colors.white,

                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.only(
                              bottom: 8.h, left: 5.w, right: 5.w));
                    } else if(emailController.text.isEmpty){
                      Get.snackbar("Error", "Please Enter your email",
                          backgroundColor:
                          Colors.black,
                          colorText: Colors.white,

                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.only(
                              bottom: 8.h, left: 5.w, right: 5.w));

                    } else if(passwordController.text.isEmpty){
                      Get.snackbar("Error", "Please Enter your password",
                          backgroundColor:
                          Colors.black,
                          colorText: Colors.white,

                          snackPosition: SnackPosition.BOTTOM,
                          margin: EdgeInsets.only(
                              bottom: 8.h, left: 5.w, right: 5.w));
                    } else{
                      authController.register(name: nameController.text,
                        email: emailController.text, password: passwordController.text,
                      );
                    }

                  },
                  child: Container(
                    height: 7.h,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: Color(0xffE2545E),
                        borderRadius: BorderRadius.circular(24.h)

                    ),
                    child: Center(child: Text('Sign Up',style: GoogleFonts.inter(color: Colors.white, fontSize: 15.sp))),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),

              Wrap(
                children: [
                  Text('Already a member? ',style: GoogleFonts.inter(color: Color(0xff00233D), fontSize: 10.sp),),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                      child: Text('Log In',style: GoogleFonts.inter(color: Colors.blue,fontSize: 10.sp)))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
