import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiledesign/view/Controller/postapicontroller.dart';
import 'package:sizer/sizer.dart';

import 'Controller/auth_controller.dart';

class AddModel extends StatefulWidget {
  const AddModel({super.key});

  @override
  State<AddModel> createState() => _AddModelState();
}

class _AddModelState extends State<AddModel> {
  List<String> collectionIds = [];
  Map<String, String> collectionMap = {};
  String? collectionId;
  String? selectedCollectionName;




  final addname = TextEditingController();
  final addslug = TextEditingController();
  final addprice = TextEditingController();
  final addlink = TextEditingController();
  final addbenefit = TextEditingController();
  final addfeatures = TextEditingController();
  final add = TextEditingController();
  String? selectedstock;

   File? galleryFile;
  final picker = ImagePicker();
  ModelController modelController = Get.put(ModelController());


  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  final List<String> items = [
    'Nothing to show',
  ];
  final List<String> item = ['Select Stock', 'available', 'out of stock'];
  Future<void> fetchCollectionList() async {
    String? token = await AuthController().getToken();
    print('usertoken $token');
    try {
      final response = await http.get(
        Uri.parse('https://testapi.crownsync.ai/api/collects'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        Map<String, String> collectionData = {};
        for (var item in data['data']) {
          collectionData[item['name']] = item['id'].toString();
        }
        setState(() {
          collectionMap = collectionData;
        });
        print('collection list == $collectionMap');
      } else {
        throw Exception('Failed to load collection list');
      }
    } catch (e) {
      print('Error fetching user list: $e');
    }
  }

  @override
  void initState() {
    fetchCollectionList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                            weight: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Create Model",
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
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                      child: Image.asset("assets/images/logo1.png"),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                children: [
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'Select Collection',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: collectionMap.keys
                  .map((String name) => DropdownMenuItem<String>(
                value: name,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff808686),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: selectedCollectionName,
              onChanged: (String? value) {
                setState(() {
                  selectedCollectionName = value;
                  collectionId = collectionMap[value];
                });
                print('Selected Collection ID: $collectionId');
              },
              buttonStyleData: ButtonStyleData(
                height: 7.h,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  color: Colors.transparent,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 30,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.black,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 320,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
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
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Enter Name",
                        contentPadding: EdgeInsets.only(left: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addslug,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Enter Slug",
                        contentPadding: EdgeInsets.only(left: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addprice,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Enter Price",
                        contentPadding: EdgeInsets.only(left: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Select Stock',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: item
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedstock,
                      onChanged: (String? value) {
                        setState(() {
                          selectedstock = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 7.h,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        iconSize: 30,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.black,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 320,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
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
                    )),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addlink,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Enter link",
                        contentPadding: EdgeInsets.only(left: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addbenefit,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Enter Benefit",
                        contentPadding: EdgeInsets.only(left: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addfeatures,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Enter Features",
                        contentPadding: EdgeInsets.only(left: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 20.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: galleryFile == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_photo_alternate,
                                        size: 50, color: Colors.grey),
                                    SizedBox(height: 10),
                                    Text('Choose File',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey)),
                                  ],
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(galleryFile!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    InkWell(
                      onTap: () {
                        modelController.model_data(imageFile: galleryFile, name: addname.text,
                            slug: addslug.text, price: addprice.text,
                            stock: selectedstock, collectionid: collectionId, link: addlink.text,
                            features: addfeatures.text, benefits: addbenefit.text);
                      },
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffE2545E),
                            borderRadius: BorderRadius.circular(24.h)),
                        child: Center(
                            child: Text('Add Model',
                                style: GoogleFonts.inter(
                                    color: Colors.white, fontSize: 15.sp))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
