import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:mobiledesign/view/email_preview.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  List<String> asignuserlist = [];
  String? selectedUser;
  List<String> collectionlist= [];
  String? selectedcollection;
  List<String> templatelist= [];
  String? selectedtemplate;


  @override
  void initState() {
    super.initState();
    fetchAssignUserList();
    fetchCollectionList();
    fetchTemplateList();


  }
  Future<void> fetchTemplateList() async {
    try {
      final response = await http.get(Uri.parse('https://api.crownsync.ai/api/rolex_models'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0ND"
              "IxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNz"
              "QwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5"
              "iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyM"
              "jMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmo"
              "g2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVz"
              "B5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2De"
              "BDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfh"
              "jX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTE"
              "q70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy02"
              "4HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dC"
              "POdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISw"
              "pAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHs"
              "bwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YG"
              "eE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9"
              "i4NHVNzlFLeCw",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> userList = [];
        for (var user in data['data']) {
          userList.add(user['name']);
        }
        setState(() {
          templatelist = userList;
        });
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      print('Error fetching user list: $e');
      // Handle error here
    }
  }
  Future<void> fetchCollectionList() async {
    try {
      final response = await http.get(Uri.parse('https://api.crownsync.ai/api/collects'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0ND"
              "IxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNz"
              "QwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5"
              "iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyM"
              "jMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmo"
              "g2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVz"
              "B5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2De"
              "BDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfh"
              "jX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTE"
              "q70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy02"
              "4HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dC"
              "POdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISw"
              "pAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHs"
              "bwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YG"
              "eE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9"
              "i4NHVNzlFLeCw",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> userList = [];
        for (var user in data['data']) {
          userList.add(user['name']);
        }
        setState(() {
          collectionlist = userList;
        });
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      print('Error fetching user list: $e');
      // Handle error here
    }
  }
  Future<void> fetchAssignUserList() async {
    try {
      final response = await http.get(Uri.parse('https://api.crownsync.ai/api/getassignuser'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9"
              ".eyJhdWQiOiIzIiwianRpIjoiZmVlOTA5NTRiZWY2YjcwYTJhOTM0ND"
              "IxMmJlZjExNzAyODhiNjhmYjg2YWJhMWNhMzFlN2JhNmViOTlhYjYxNz"
              "QwOWU3NTIxMGYxOTMyOTUiLCJpYXQiOjE3MTM1ODA5NzYuMTQ5OTIsIm5"
              "iZiI6MTcxMzU4MDk3Ni4xNDk5MjIsImV4cCI6MTc0NTExNjk3Ni4xNDkyM"
              "jMsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.cGLvvj6_Psy-cbfwbj-43iqmo"
              "g2OpW_xfSEXXKjk-1H0MIRUyg3mtYlHGgMDL8gMEstRXuNLAk5Tka-Jb4zVz"
              "B5T1huKcjoOKTVeRjmXFElDBtu-nVJTxy3alN77YxwO16zhuV-46SujWlu2De"
              "BDqs02YWgsxB3PxcF51RoQWI3lR6xnYadUPOLsCeA5uvrH5h4XkwXKNMsIxPfh"
              "jX-ZrWxs7U77Ewf_qFF3JHdVMmmRBhR1HOQHsp3rJwa2o2Vqn0t8mgs86H7iXTE"
              "q70kOrCpEV2O2Q_Cu8IgS0cF9aRjF8fjvS84ujkQPXn1gjTj0gDFBThZVBiTBy02"
              "4HriBBoq3lXjnmb2TNr6oULn5khQmYBX8fj_qGKd-_Oz-kS1QTYd9UEKTbHBHY2dC"
              "POdTJZcNALTipPQ2iLulg3pVOXURPJ-ty2pu9Igt15o-DyQBRhnpMm9ScQzTpIHISw"
              "pAfNPOaU5sLnV0wxCRR_-xdO4vBRGLBy3zrMdKkQmfol1DjWbtk0f7rKpICJkYTzrHs"
              "bwPo_Pef2XOgA6Dn2uA_MmBkld7aTZoqXg8CcJGGwseTmqB7SNsSe5Dj0vq_Y9gnY1YG"
              "eE57HW0G-yOxp76hTgvcs5xF-AYGjOvG91aHZqUzYVi7NIb_ujRKYNiw2EuNehLxk__V9"
              "i4NHVNzlFLeCw",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> userList = [];
        for (var user in data['data']) {
          userList.add(user['team_id']);
        }
        setState(() {
          asignuserlist = userList;
        });
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      print('Error fetching user list: $e');
      // Handle error here
    }
  }

  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 15.h,
                width: double.infinity,
                color: Colors.white,
                padding:  EdgeInsets.only(top: 7.h,left: 4.w,right: 4.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back,),
                            Text(
                              'Details',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 18.sp),
                            ),
                          ],
                        ),
                        Spacer(),

                      ],
                    ),

                  ],
                ),
              ),
SizedBox(height: 2.h,),
              Container(
                height: 12.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 1.h,right: 4.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 4, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        4, // Move to bottom 10 Vertically
                      ),
                    )
                  ],

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assign Email',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff808686),
                           fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Select team member',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff808686),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: asignuserlist.map((String email) {
                          return DropdownMenuItem<String>(
                            value: email,
                            child: Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808686),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        value: selectedUser,
                        onChanged: (String? value) {
                          setState(() {
                            selectedUser = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 5.h,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xff808686),
                            ),
                            color: Color(0xffE0E1E1),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                          iconSize: 30,
                          iconEnabledColor: Color(0xff808686),
                          iconDisabledColor: Color(0xff808686),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffE0E1E1),
                          ),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 12.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 1.h,right: 4.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 4, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        4, // Move to bottom 10 Vertically
                      ),
                    )
                  ],

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responder Email',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff808686),

                          fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),

Container(
  height: 6.h,
  width: double.infinity,
  padding: EdgeInsets.only(top: 1.5.h,left: 3.w,),
  decoration: BoxDecoration(
    color: Color(0xffE0E1E1),
    borderRadius: BorderRadius.circular(1.h),
    border: Border.all(
      color: Color(0xff808686),
    )

  ),

    child: Text(
      'khanamna983@gmail.com',
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: Color(0xff808686),

          fontSize: 12.sp),
    ),

),

                  ],
                ),
              ),

              SizedBox(height: 2.h,),

              Container(
                height: 12.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 1.h,right: 4.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 4, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        4, // Move to bottom 10 Vertically
                      ),
                    )
                  ],

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Store Location',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff808686),

                          fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 4.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            color: Color(0xffE0E1E1),
                            borderRadius: BorderRadius.circular(1.h),

                          ),
                          child: Center(child: Text('${apiController.rolexModel?.data?[0].location}',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff808686),

                              fontSize: 9.sp),),),
                        ),
                        Container(
                          height: 4.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                              color: Color(0xffE0E1E1),
                              borderRadius: BorderRadius.circular(1.h),

                          ),
                          child: Center(child: Text('${apiController.rolexModel?.data?[1].location}',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff808686),

                              fontSize: 9.sp),),),
                        ),
                        Container(
                          height: 4.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Color(0xffE0E1E1),
                              borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Center(child: Text('${apiController.rolexModel?.data?[2].location}',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff808686),

                              fontSize: 10.sp),),),

                        )
                      ],)
                  ],
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 12.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 1.h,right: 4.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 4, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        4, // Move to bottom 10 Vertically
                      ),
                    )
                  ],

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collections',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff828282),

                          fontSize: 13.sp),
                    ),
                    SizedBox(height: 1.h,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Select a selection',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff808686),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: collectionlist.map((String email) {
                          return DropdownMenuItem<String>(
                            value: email,
                            child: Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808686),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        value: selectedcollection,
                        onChanged: (String? value) {
                          setState(() {
                            selectedcollection = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 5.h,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xff808686),
                            ),
                            color: Color(0xffE0E1E1),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                          iconSize: 30,
                          iconEnabledColor: Color(0xff808686),
                          iconDisabledColor: Color(0xff808686),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffE0E1E1),
                          ),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 12.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 1.h,right: 4.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.10),
                      blurRadius: 4, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        4, // Move to bottom 10 Vertically
                      ),
                    )
                  ],

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Template',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff828282),

                          fontSize: 13.sp),
                    ),
                    SizedBox(height: 1.h,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Select a selection',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff808686),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: templatelist.map((String email) {
                          return DropdownMenuItem<String>(
                            value: email,
                            child: Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808686),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        value: selectedtemplate,
                        onChanged: (String? value) {
                          setState(() {
                            selectedtemplate = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 5.h,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xff808686),
                            ),
                            color: Color(0xffE0E1E1),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                          iconSize: 30,
                          iconEnabledColor: Color(0xff808686),
                          iconDisabledColor: Color(0xff808686),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffE0E1E1),
                          ),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),


                  ],
                ),
              ),


              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmailPreview()));
                },
                child: Container(height: 7.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 5.w,right: 5.w),
                  decoration: BoxDecoration(
                      color: Color(0xffE2545E),
                      borderRadius: BorderRadius.circular(4.h)
                  ),
                  child: Center(
                    child: Text(
                        'Proceed',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,

                            fontSize: 20.sp)
                    ),
                  ),
                ),
              ),



            ],
          ),
      ),

    );
  }
}
