import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class AddStore extends StatefulWidget {
  const AddStore({super.key});

  @override
  State<AddStore> createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  final addstore = TextEditingController();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
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
                    padding:  EdgeInsets.all(8.0),
                    child: Container(
       
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
       
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back,size: 20,weight: 2,),
                      ),
                    ),
                  ),
                ),
       
                Text(
                  "Create Store",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
             SizedBox(height: 2.h,),
             Padding(
               padding: EdgeInsets.only(right: 5.w,left: 5.w),
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                      child: Image.asset("assets/images/logo1.png"),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addstore,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Store Name",
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
                    SizedBox(height: 5.h,),
       
       
       
                      InkWell(
       
                        onTap: (){
                        if (addstore.text.isEmpty) {
                          Get.snackbar("Error", "Please Enter store Name",
                              backgroundColor:
                              Colors.black,
                              colorText: Colors.white,
       
                              snackPosition: SnackPosition.BOTTOM,
                              margin: EdgeInsets.only(
                                  bottom: 8.h, left: 5.w, right: 5.w));
                        }
       
                        else{
                          authController.add_store(storename: addstore.text);
                        }

                      },
       
       
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
       
                        decoration: BoxDecoration(
                            color: Color(0xffE2545E),
                            borderRadius: BorderRadius.circular(24.h)
       
                        ),
                        child: Center(child: Text('Add Store',style: GoogleFonts.inter(color: Colors.white, fontSize: 15.sp))),
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
