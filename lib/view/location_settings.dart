import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:mobiledesign/view/add_location.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class LocationSetting extends StatefulWidget {
  const LocationSetting({super.key});

  @override
  State<LocationSetting> createState() => _LocationSettingState();
}

class _LocationSettingState extends State<LocationSetting> {
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
                          'Location Setting',
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
                Get.to(AddLocation());
              },
              child: Container(
                height: 5.h,
                width: 28.w,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                    borderRadius: BorderRadius.circular(4.h)),
                child: Center(
                    child: Text('Add Location',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 10.sp))),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: Obx(
                  () =>
                  apiController.isloader.value
                  ? Center(child: CircularProgressIndicator())
                  :
                  ListView.builder(
                itemCount: apiController.locationdata?.data?.length,
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
                          '${apiController.locationdata?.data?[index].location}',
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
                              onTap: () {
                                authController.deleteLocation(
                                    apiController.locationdata?.data?[index]
                                        .id, onScopeDeleted: (sucess) {
                                  if (sucess) {
                                    // Scope deleted successfully, refresh the list
                                    refreshList();
                                  }
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.black12,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            InkWell(
                              onTap: () {
                                // showEditDialog(index);

                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.black12,
                              ),
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

  void refreshList() {
    apiController.get_location();
  }

  Future<void> updateLocation(int? id, String newQuery) async {
    try {
      String? token = await AuthController().getToken();

      final response = await http.put(
        Uri.parse('https://testapi.crownsync.ai/api/admin/update-location/$id'),
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: {'location': newQuery},
      );

      if (response.statusCode == 200) {
        // Scope updated successfully
        print('Location updated successfully');
        // Refresh the list
        refreshList();
      } else {
        // Handle errors
        print('Failed to update location. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      print('Error: $e');
    }
  }

  void showEditDialog(int index) {
    String query = apiController.querydata?.data?[index].query ?? '';

    showDialog(
      context: context,
      builder: (context) {
        TextEditingController controller = TextEditingController(text: query);
        return AlertDialog(
          title: Text('Edit Scope',style: GoogleFonts.inter(color: Colors.black, fontSize: 15.sp)),
          content: TextFormField(
            cursorColor: Color(0xff00233D),
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(1.h),
              ),
              labelText: "Edit Query",
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
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context); // Close dialog

              },
              child: Container(
                height: 5.h,
                width: 25.w,

                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                    borderRadius: BorderRadius.circular(24.h)

                ),
                child: Center(child:
                Text('Cancel',
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 12.sp))),
              ),
            ),
            InkWell(
              onTap: () async{
                await updateScope(
                    apiController.querydata?.data?[index].id, controller.text);
                Navigator.pop(context);
              },
              child: Container(
                height: 5.h,
                width: 25.w,

                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                    borderRadius: BorderRadius.circular(24.h)

                ),
                child: Center(child:
                Text('Update',
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 12.sp))),
              ),
            ),

          ],
        );
      },
    );
  }
}
