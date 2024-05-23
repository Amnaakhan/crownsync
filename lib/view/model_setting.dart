import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:mobiledesign/view/Controller/postapicontroller.dart';
import 'package:sizer/sizer.dart';

class ModelSetting extends StatefulWidget {
  const ModelSetting({super.key});

  @override
  State<ModelSetting> createState() => _ModelSettingState();
}

class _ModelSettingState extends State<ModelSetting> {
  ApiController apiController = Get.put(ApiController());
  ModelController modelController = Get.put(ModelController());


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
                          'Model Setting',
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
              onTap: () {
                // Get.to(AddScope());
              },
              child: Container(
                height: 5.h,
                width: 28.w,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                    borderRadius: BorderRadius.circular(4.h)),
                child: Center(
                    child: Text('Create Model',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 10.sp))),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(

            child: Obx(()=> apiController.isLoading.value?
            const Center(
              child: CircularProgressIndicator(),
            ):
             ListView.builder(
                itemCount: apiController.rolexxModel?.data?.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    height: 15.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                    padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 2.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.h),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff000000).withOpacity(0.10),
                          blurRadius: 4, // soften the shadow
                          spreadRadius: 0, //extend the shadow
                          offset: const Offset(
                            0,
                            4,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Model name',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  'Collection name',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  'Slug',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  'Price',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${apiController.rolexxModel?.data?[index].name}',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  '${apiController.rolexxModel?.data?[index].collectionName}',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  '${apiController.rolexxModel?.data?[index].slug}',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  '${apiController.rolexxModel?.data?[index].price}',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 40.w,
                            ),
                            InkWell(
                              onTap: () {
                                modelController.deleteItem(apiController.rolexxModel?.data?[index].id);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.black12,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(Icons.edit, color: Colors.black12, size: 20.sp),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
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
