import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  final String? selectedemail;

  const DetailsScreen({super.key, this.selectedemail});

  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> asignuserlist = [];
  String? selectedUser;
  List<String> collectionlist = [];
  String? selectedcollection;
  List<String> templatelist = [];
  List id = [];
  String? selectedtemplate;
  List<String> _watchNames = [];
  String? _selectedWatch;
  String? _selectedModel;
  List<Map<String, dynamic>> _rolexModels = [];
  int? templateId;
  int? collectionid;
  String? _selectedModelId;
  int? _selectedModelIdInt;
  String? selectedLocation;
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    fetchAssignUserList();
    fetchCollectionList();
    fetchTemplateList();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      List<String> watchNames = await fetchWatchNames();
      setState(() {
        _watchNames = watchNames;
      });
    } catch (error) {
      print('Error fetching watch names: $error');
    }
  }

  Future<List<String>> fetchWatchNames() async {
    String? token = await AuthController().getToken();
    print('usertoken $token');
    final response = await http.get(
      Uri.parse('https://api.crownsync.ai/api/collects'),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      List<String> watchNames = [];
      final List<dynamic> data = json.decode(response.body)['data'];

      for (var item in data) {
        watchNames.add(item['name']);
      }

      return watchNames;
    } else {
      throw Exception('Failed to load watch names');
    }
  }

  Future<List<Map<String, dynamic>>> fetchModelsForWatch(
      String watchName) async {
    String? token = await AuthController().getToken();
    print('usertoken $token');
    final response = await http.get(
      Uri.parse('https://api.crownsync.ai/api/collects'),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<Map<String, dynamic>> models = [];

      for (var item in data) {
        if (item['name'] == watchName) {
          models = List<Map<String, dynamic>>.from(item['rolexModels']);
          break;
        }
      }

      return models;
    } else {
      throw Exception('Failed to load models for $watchName');
    }
  }

  Future<void> fetchTemplateList() async {
    String? token = await AuthController().getToken();
    print('usertoken $token');
    try {
      final response = await http.get(
        Uri.parse('https://api.crownsync.ai/api/admin/mail_templates'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> userList = [];
        List ids = [];
        for (var user in data['data']) {
          userList.add(user['template_name']);
          ids.add(user['id']);
        }
        setState(() {
          templatelist = userList;
          id = ids;
          print('id == ${id}');
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
    String? token = await AuthController().getToken();
    print('usertoken $token');
    try {
      final response = await http.get(
        Uri.parse('https://api.crownsync.ai/api/collects'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
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
    String? token = await AuthController().getToken();
    print('usertoken $token');
    try {
      final response = await http.get(
        Uri.parse('https://api.crownsync.ai/api/getuserlist'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> userList = [];
        for (var user in data['data']) {
          userList.add(user['user_name']);
        }
        setState(() {
          asignuserlist = userList;
        });
        print('userlist ${asignuserlist}');
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
    print('Sender Email ${widget.selectedemail}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15.h,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
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
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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
                  SizedBox(
                    height: 1.h,
                  ),
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
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
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
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 1.5.h,
                      left: 3.w,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffE0E1E1),
                        borderRadius: BorderRadius.circular(1.h),
                        border: Border.all(
                          color: Color(0xff808686),
                        )),
                    child: Text(
                      '${apiController.loginModel?.data?.contact}',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff808686),
                          fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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
                        fontWeight: FontWeight.w500,
                        color: Color(0xff808686),
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Select Template',
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
                        int index = templatelist.indexOf(email);
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
                          key: ValueKey(id[index]),
                        );
                      }).toList(),
                      value: selectedtemplate,
                      onChanged: (String? value) {
                        setState(() {
                          selectedtemplate = value;
                        });
                        int index = templatelist.indexOf(value!);
                        templateId = id[index]; // Update the selected ID
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
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
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
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 13.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 8.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: apiController.rolexxModel?.data?.length,
                        itemBuilder: (context, index) {

                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedLocation = apiController.rolexxModel?.data?[index].location;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 1.h,left: 1.w,right: 1.w,bottom: 1.h),
                          height: 4.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            color: apiController.rolexxModel?.data?[index].location == selectedLocation
                                ? Color(0xffE2545E) // Change color for selected location
                                : Color(0xffE0E1E1), // Default color
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Center(
                            child: Text(
                              '${apiController.rolexxModel?.data?[index].location}',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: apiController.rolexxModel?.data?[index].location == selectedLocation
                                      ? Colors.white // Change text color for selected location
                                      : Color(0xff808686),
                                  fontSize: 9.sp),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       height: 4.h,
                  //       width: 27.w,
                  //       decoration: BoxDecoration(
                  //         color: Color(0xffE0E1E1),
                  //         borderRadius: BorderRadius.circular(1.h),
                  //
                  //       ),
                  //       child: Center(
                  //         child:
                  //       Text('${apiController.rolexxModel?.data?[0].location}'
                  //         ,style: GoogleFonts.inter(
                  //           fontWeight: FontWeight.w500,
                  //           color: Color(0xff808686),
                  //
                  //           fontSize: 9.sp),),),
                  //     ),
                  //     Container(
                  //       height: 4.h,
                  //       width: 27.w,
                  //       decoration: BoxDecoration(
                  //           color: Color(0xffE0E1E1),
                  //           borderRadius: BorderRadius.circular(1.h),
                  //
                  //       ),
                  //       child: Center(child:
                  //       Text('${apiController.rolexxModel?.data?[1].location}'
                  //         ,style: GoogleFonts.inter(
                  //           fontWeight: FontWeight.w500,
                  //           color: Color(0xff808686),
                  //
                  //           fontSize: 9.sp),),),
                  //     ),
                  //     Container(
                  //       height: 4.h,
                  //       width: 25.w,
                  //       decoration: BoxDecoration(
                  //           color: Color(0xffE0E1E1),
                  //           borderRadius: BorderRadius.circular(1.h),
                  //       ),
                  //       child: Center(child:
                  //       Text('${apiController.rolexxModel?.data?[2].location}',
                  //         style: GoogleFonts.inter(
                  //           fontWeight: FontWeight.w500,
                  //           color: Color(0xff808686),
                  //
                  //           fontSize: 10.sp),),),
                  //
                  //     )
                  //   ],)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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
                    SizedBox(
                      height: 1.h,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Select collection',
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
                        items: _watchNames.map((String watchName) {
                          return DropdownMenuItem<String>(
                            value: watchName,
                            child: Text(
                              watchName,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808686),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        value: _selectedWatch,
                        onChanged: (String? value) async {
                          setState(() {
                            _selectedWatch = value;
                            _rolexModels = []; // Clear previous models
                          });
                          if (value != null) {
                            try {
                              List<Map<String, dynamic>> models =
                                  await fetchModelsForWatch(value);
                              setState(() {
                                _rolexModels = models;
                              });
                            } catch (error) {
                              print('Error fetching models: $error');
                            }
                          }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 5.h,
                          width: 300,
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
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              margin: EdgeInsets.only(left: 4.w, right: 4.w),
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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
                    'Choose Model',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff828282),
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Select a model',
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
                      items: _rolexModels.map((Map<String, dynamic> model) {
                        return DropdownMenuItem<String>(
                          value: model['id'].toString(),
                          child: Text(
                            model['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff808686),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      value: _selectedModel,
                      // Update onChanged to assign selected model ID to _selectedModelId and _selectedModelIdInt
                      onChanged: (String? value) {
                        setState(() {
                          _selectedModel = value;
                          _selectedModelId =
                              value; // Assign the selected model ID as String
                          // Convert the selected model ID to an int
                          _selectedModelIdInt =
                              value != null ? int.tryParse(value) : null;
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
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                authController.email_preview(
                    respondername: "Amna khan",
                    responderemail: "${apiController.loginModel?.data?.contact}",
                    recivername: '${apiController.profileModel?.data?.name}',
                    reciveremail: '${apiController.profileModel?.data?.email}',
                    productid: _selectedModelId,
                    tempelateid: templateId.toString());
              },
              child: Container(
                height: 7.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                    color: Color(0xffE2545E),
                    borderRadius: BorderRadius.circular(4.h)),
                child: Center(
                  child: Text('Proceed',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp)),
                ),
              ),
            ),
            SizedBox(height: 4.h,),

          ],
        ),
      ),
    );
  }
}
