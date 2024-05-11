import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/AddScope.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';

class ScopeSetting extends StatefulWidget {
  const ScopeSetting({super.key});

  @override
  State<ScopeSetting> createState() => _ScopeSettingState();
}

class _ScopeSettingState extends State<ScopeSetting> {
  ApiController apiController = Get.put(ApiController());
  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          onTap: () {
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
                        child: Image.asset(
                          "assets/images/logo1.png",
                          height: 3.h,
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                Get.to(AddScope());
              },
              child: Container(
                height: 5.h,
                width: 28.w,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                    color: Color(0xffE2545E),

                    borderRadius: BorderRadius.circular(4.h)
                ),
                child: Center(child:
                Text('Create Scope',
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 10.sp))),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: Obx(()=> apiController.isLoading.value?
                Center(child: CircularProgressIndicator()):
              ListView.builder(
                itemCount: apiController.querydata?.data?.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    height: 8.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 1.h, bottom: 1.h, left: 5.w, right: 5.w),
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.h),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff000000).withOpacity(0.10),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.5.h),
                        Text(
                          '${apiController.querydata?.data?[index].query}',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                  onTap: (){
              authController.deleteUser(apiController.querydata?.data?[index].id);
                  },
                              child: Icon(
                                Icons.delete,
                                color: Colors.black12,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.black12,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
