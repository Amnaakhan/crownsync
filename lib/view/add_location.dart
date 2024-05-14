
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  final addlocation = TextEditingController();
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
                  "Create Location",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w,right: 5.w),
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
                    controller: addlocation,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      labelText: "Location Name",
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
                      if (addlocation.text.isEmpty) {
                        Get.snackbar("Error", "Please Enter Location",
                            backgroundColor:
                            Colors.black,
                            colorText: Colors.white,

                            snackPosition: SnackPosition.BOTTOM,
                            margin: EdgeInsets.only(
                                bottom: 8.h, left: 5.w, right: 5.w));
                      }

                      else{
                        authController.add_location( locationname: addlocation.text, onQueryAdded: (success ) {
                          if (success) {
                            // Query added successfully, refresh the list
                            Get.find<ApiController>().get_location();
                            // Navigate back
                            Get.back();
                          }

                        });
                      }
                    },


                    child: Container(
                      height: 7.h,
                      width: double.infinity,

                      decoration: BoxDecoration(
                          color: Color(0xffE2545E),
                          borderRadius: BorderRadius.circular(24.h)

                      ),
                      child: Center(child:
                      Text('Add Location',
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 15.sp))),
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
