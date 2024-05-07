import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class CreateTemplete extends StatefulWidget {
  const CreateTemplete({super.key});

  @override
  State<CreateTemplete> createState() => _CreateTempleteState();
}

class _CreateTempleteState extends State<CreateTemplete> {
  final addtitle = TextEditingController();
  final addtemp = TextEditingController();

  AuthController authController = Get.put(AuthController());

  void setName() {
    setState(() {
      addtemp.text = "${addtemp.text} [My Name]";

    });
  }
  void setClientname() {
    setState(() {
      addtemp.text = "${addtemp.text} [Client Name]";

    });
  }
  void setemail() {
    setState(() {
      addtemp.text = "${addtemp.text} [My Email]";

    });
  }
  void setlink() {
    setState(() {
      addtemp.text = "${addtemp.text} [Link]";

    });
  }
  void setstore() {
    setState(() {
      addtemp.text = "${addtemp.text} [Address]";

    });
  }
  void setcollection() {
    setState(() {
      addtemp.text = "${addtemp.text} [Collection]";

    });
  }
  void setimage() {
    setState(() {
      addtemp.text = "${addtemp.text} [image]";

    });
  }
  void setfeatures() {
    setState(() {
      addtemp.text = "${addtemp.text} [features]";

    });
  }

  void setmodelname() {
    setState(() {
      addtemp.text = "${addtemp.text} [Model]";

    });
  }
  void setstorename() {
    setState(() {
      addtemp.text = "${addtemp.text} [Store]";

    });
  }
  void setBenefits() {
    setState(() {
      addtemp.text = "${addtemp.text} [Benefits]";

    });
  }
  void setLocation() {
    setState(() {
      addtemp.text = "${addtemp.text} [Location]";

    });
  }
  void setStock() {
    setState(() {
      addtemp.text = "${addtemp.text} [Stock]";

    });
  }
  void setPrice() {
    setState(() {
      addtemp.text = "${addtemp.text} [Price]";

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                    "Create Tempelate",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 7.w, left: 7.w, top: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setName();
                          },
                          child: Container(
                            height: 5.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('My name',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setClientname();
                          },
                          child: Container(
                            height: 5.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Client name',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setemail();
                          },
                          child: Container(
                            height: 5.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('My email',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setlink();
                          },
                          child: Container(
                            height: 5.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('link',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setstore();
                          },
                          child: Container(
                            height: 5.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Store address',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setcollection();
                          },
                          child: Container(
                            height: 5.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Collection name',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setimage();
                          },
                          child: Container(
                            height: 5.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Image',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        Container(
                          height: 5.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Color(0xffE2545E),
                              borderRadius: BorderRadius.circular(24.h)),
                          child: Center(
                              child: Text('Features',
                                  style: GoogleFonts.inter(
                                      color: Colors.white, fontSize: 12.sp))),
                        ),
                        InkWell(
                          onTap: (){
                            setmodelname();
                          },
                          child: Container(
                            height: 5.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Model name',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setstorename();
                          },
                          child: Container(
                            height: 5.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Store',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setBenefits();
                          },
                          child: Container(
                            height: 5.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Benefits',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setLocation();
                          },
                          child: Container(
                            height: 5.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Location',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            setPrice();
                          },
                          child: Container(
                            height: 5.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Price',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                        InkWell(onTap: (){
                          setStock();
                        },
                          child: Container(
                            height: 5.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Color(0xffE2545E),
                                borderRadius: BorderRadius.circular(24.h)),
                            child: Center(
                                child: Text('Stoke',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 12.sp))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addtitle,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Add title",
                        contentPadding: EdgeInsets.only(left: 5.w,top: 1.h,right: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        floatingLabelStyle:
                            GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
        
                        filled: true,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        fillColor: Colors.transparent,
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always, // Set the label behavior
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      cursorColor: Color(0xff00233D),
                      controller: addtemp,
                      maxLines: 12, // Allow multiple lines
        
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        labelText: "Add Templete",
                        contentPadding: EdgeInsets.only(left: 5.w,top: 2.h,right: 5.w),
                        labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
                        floatingLabelStyle:
                            GoogleFonts.inter(color: Color(0xff00233D)),
                        alignLabelWithHint: true,
        
                        filled: true,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        fillColor: Colors.transparent,
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always, // Set the label behavior
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InkWell(
                      onTap: (){
                        if (addtitle.text.isEmpty) {
                          Get.snackbar("Error", "Please Enter Templete Name",
                              backgroundColor:
                              Colors.black,
                              colorText: Colors.white,
        
                              snackPosition: SnackPosition.BOTTOM,
                              margin: EdgeInsets.only(
                                  bottom: 8.h, left: 5.w, right: 5.w));
                        }  else if (addtemp.text.isEmpty) {
                          Get.snackbar("Error", "Please Enter Templete ",
                              backgroundColor:
                              Colors.black,
                              colorText: Colors.white,
        
                              snackPosition: SnackPosition.BOTTOM,
                              margin: EdgeInsets.only(
                                  bottom: 8.h, left: 5.w, right: 5.w));
                        }
        
                        else{
                          authController.add_templete(tempname: addtitle.text, heading: addtemp.text);
                        }
                      },
        
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffE2545E),
                            borderRadius: BorderRadius.circular(24.h)),
                        child: Center(
                            child: Text('Add Template',
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   TextEditingController addtemp = TextEditingController();
//
//   void setText() {
//     setState(() {
//       addtemp.text = "Add Name"; // Set text to "Add Name" when button is pressed
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TextField with Button'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextFormField(
//               cursorColor: Color(0xff00233D),
//               controller: addtemp,
//               maxLines: 12,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 labelText: "Add Template",
//                 contentPadding: EdgeInsets.only(left: 20.0),
//                 labelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
//                 floatingLabelStyle: GoogleFonts.inter(color: Color(0xff00233D)),
//                 alignLabelWithHint: true,
//                 filled: true,
//                 fillColor: Colors.transparent,
//                 floatingLabelAlignment: FloatingLabelAlignment.start,
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: setText,
//               child: Text('Add Name'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
