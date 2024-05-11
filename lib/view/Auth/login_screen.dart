import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/Helper/helper.dart';
import 'package:mobiledesign/view/Auth/register_screen.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  AuthController authController = Get.put(AuthController());
  GlobalKey<FormState> form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h,left: 7.w,right: 7.w),
            child: Column(
              children: [
            Center(child: Image.asset('assets/images/logo1.png',height: 13.h,)),
                SizedBox(height: 7.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Login',    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20.sp),),
                ),
                SizedBox(height: 1.h,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Welcome back',    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 13.sp),),
                ),
                SizedBox(height: 3.h,),



                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    labelText: "Email",
                    contentPadding: EdgeInsets.only(left: 3.w,right: 2.w),
                    labelStyle: GoogleFonts.inter(color: const Color(0xff00233D)),
                    floatingLabelStyle: GoogleFonts.inter(color: const Color(0xff00233D)),
                    alignLabelWithHint: true,

                    filled: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.always, // Set the label behavior
                  ),
                  validator: (value) {
                    return Helpers.validate(
                      value: value ?? '',
                      is_required: true,
                      fieldName: 'Email',
                    );
                  },
                ),
                SizedBox(height: 3.h,),

                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    labelText: "Password",
                    contentPadding: EdgeInsets.only(left: 3.w,right: 2.w),
                    labelStyle: GoogleFonts.inter(color: const Color(0xff00233D)),
                    floatingLabelStyle: GoogleFonts.inter(color: const Color(0xff00233D)),
                    alignLabelWithHint: true,

                    filled: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.always, // Set the label behavior
                  ),
                  validator: (value) {
                    return Helpers.validate(
                      value: value ?? '',
                      is_required: true,
                      min: 8,
                      fieldName: 'Password',
                    );
                  },
                ),
                SizedBox(height: 3.h,),
                Align(
                    child: Text('Forgot Password',style: GoogleFonts.inter(color: Colors.blue,fontSize: 10.sp))),

                SizedBox(height: 3.h,),

                Obx(()=>authController.isLoading.value?const Center(child: CircularProgressIndicator(),):
                   InkWell(
                    onTap: (){
                      // if (emailController.text.isEmpty) {
                      //   Get.snackbar("Error", "Please Enter your email",
                      //       backgroundColor:
                      //       Colors.black,
                      //       colorText: Colors.white,
                      //
                      //       snackPosition: SnackPosition.BOTTOM,
                      //       margin: EdgeInsets.only(
                      //           bottom: 8.h, left: 5.w, right: 5.w));
                      // }
                      // else if(passwordController.text.isEmpty){
                      //   Get.snackbar("Error", "Please Enter your password",
                      //       backgroundColor:
                      //       Colors.black,
                      //       colorText: Colors.white,
                      //
                      //       snackPosition: SnackPosition.BOTTOM,
                      //       margin: EdgeInsets.only(
                      //           bottom: 8.h, left: 5.w, right: 5.w));
                      // }
                      // else{
                      //   authController.login(email: emailController.text, password: passwordController.text);
                      //
                      // }
                      if(form.currentState!.validate()){

                          authController.login(email: emailController.text,
                              password: passwordController.text);

                      }
                    },
                    child: Container(
                      height: 7.h,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: const Color(0xffE2545E),
                        borderRadius: BorderRadius.circular(24.h)

                      ),
                      child: Center(child: Text('Login',style: GoogleFonts.inter(color: Colors.white, fontSize: 15.sp))),
                    ),
                  ),
                ),

                SizedBox(height: 5.h,),


                Wrap(
                  children: [
                    Text(' Don’t have an account?',
                      style: GoogleFonts.inter(color: const Color(0xff00233D),
                          fontSize: 10.sp),),
                    InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text('Sign Up',style: GoogleFonts.inter(color: Colors.blue,fontSize: 10.sp)))

                  ],
                ),
                SizedBox(height: 10.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
