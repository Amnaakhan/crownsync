import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with TickerProviderStateMixin {
  int _activeIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    fetchUserList();
    _tabController = new TabController(vsync: this, length: 3);

  }
  List<String> emails = [];
  String? selectedEmail;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item8',
  ];
  String? selectedValue;
  ApiController apiController = Get.put(ApiController());

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  // void searchEmails(String keyword) {
  //   // Filter emails based on the keyword
  //   List<Email> filteredEmails = emails.where((email) {
  //     return email.subject.toLowerCase().contains(keyword.toLowerCase()) ||
  //         email.sender.toLowerCase().contains(keyword.toLowerCase()) ||
  //         email.body.toLowerCase().contains(keyword.toLowerCase());
  //   }).toList();
  //
  //   // Update the UI with filtered emails
  //   setState(() {
  //     displayedEmails = filteredEmails;
  //   });
  // }
  Future<void> fetchUserList() async {
    try {
      final response = await http.get(Uri.parse('https://api.crownsync.ai/api/userlist'),
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
        List<String> emailList = [];
        for (var user in data['data']) {
          emailList.add(user['email']);
        }
        setState(() {
          emails = emailList;
        });
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      print('Error fetching user list: $e');
      // Handle error here
    }
  }
  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    apiController.get_userlist();
    return Scaffold(
      body:  Padding(
          padding: EdgeInsets.only(
            top: 7.h,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 4.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Inbox',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, fontSize: 20.sp),
                        ),
                       Spacer(),
                        Container(
                            height: 5.h,
                            width: 60.w,
                            padding: EdgeInsets.only(right: 2.w),
                            decoration: BoxDecoration(
                                color: Color(0xffF0F0F0),
                                borderRadius: BorderRadius.circular(4.h)),
                            child: Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 2.w,
                                    ),

                                    Text(
                                      '${apiController.profileModel?.data?.email}',
                                      style: GoogleFonts.inter(
                                          color: Colors.grey,
                                          fontSize: 11.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Image.asset(
                                      'assets/images/drop_arrow.png',
                                      height: 1.h,
                                      color: Colors.grey,
                                    )
                                  ],
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [

                           DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      'User List',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: emails.map((String email) {
                                return DropdownMenuItem<String>(
                                  value: email,
                                  child: Text(
                                    email,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              value: selectedEmail,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedEmail = value;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 5.h,
                                width: 180,
                                padding: const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  color: Color(0xffE2545E),
                                ),
                                elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                ),
                                iconSize: 30,
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.white,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffE2545E),
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

                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                            height: 5.h,
                            width: 5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(
                                  color: Color(0xff4D4D4D),
                                )),
                          child: Center(
                            child: Icon(Icons.calendar_month_outlined),
                          ),
                           ),
                        SizedBox(width: 2.w,),
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(
                                color: Color(0xff4D4D4D),
                              )),
                          child: Center(
                            child: Icon(Icons.search),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(
                                color: Color(0xff4D4D4D),
                              )),
                          child: Center(
                            child: Icon(Icons.check_circle_outline),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),


                Expanded(


                 child:  Obx(()=> apiController.isLoading.value?Center(child: CircularProgressIndicator(),):
                 apiController.emailMessagesModel?.data == null?Center(child: Text('Nothing to show',style: GoogleFonts.inter(
                     color: Colors.black,
                     fontWeight: FontWeight.w500,
                     fontSize: 12.sp),),):
                    ListView.builder(
                     itemCount: apiController.emailMessagesModel?.data?.length,
                     itemBuilder: (context, index) {
                       return Container(
                         height: 15.h,
                         width: double.infinity,
                         margin: EdgeInsets.only(left: 4.w, right: 4.w,top: 1.h,bottom: 1.h),
                         padding: EdgeInsets.only(left: 4.w, top: 2.5.h, right: 2.w),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(2.h),
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
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Stack(
                                   children: [
                                     Image.asset(
                                       'assets/images/profile_icon.png',
                                       height: 9.h,
                                       width: 9.h,
                                     ),
                                     Padding(
                                         padding:
                                         EdgeInsets.only(top: 6.h, left: 10.w),
                                         child: Image.asset(
                                           'assets/images/mail.png',
                                           height: 4.h,
                                         ))
                                   ],
                                 ),
                                 SizedBox(
                                   width: 2.w,
                                 ),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       '${apiController.emailMessagesModel?.data?[index].detail?.headers?.received}',
                                       style: GoogleFonts.inter(
                                           color: Colors.black,
                                           fontWeight: FontWeight.w500,
                                           fontSize: 12.sp),
                                     ),
                                     Row(
                                       children: [
                                         Text(
                                           '1min',
                                           style: GoogleFonts.inter(
                                               color: Color(0xff7B7B7D),
                                               fontSize: 7.sp),
                                         ),
                                         SizedBox(
                                           width: 1.w,
                                         ),
                                         Icon(
                                           Icons.history,
                                           size: 10.sp,
                                           color: Color(0xff7B7B7D),
                                         )
                                       ],
                                     ),
                                     Container(
                                       width: 60.w,
                                       // color: Colors.blue,
                                       child: Text(
                                         'I m interested in the Rolex Oyster Perpetual 31, is it still available?',
                                         style: GoogleFonts.inter(
                                             color: Colors.black,
                                             fontWeight: FontWeight.w500,
                                             fontSize: 8.sp),
                                       ),
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         SizedBox(
                                           width: 40.w,
                                         ),
                                         Icon(
                                           Icons.delete_outline,
                                           color: Colors.black12,
                                           size: 15.sp,
                                         ),
                                         SizedBox(
                                           width: 2.w,
                                         ),
                                         Icon(Icons.visibility_off_outlined,
                                             color: Colors.black12, size: 15.sp),
                                         SizedBox(
                                           width: 2.w,
                                         ),
                                         Icon(Icons.messenger_outline,
                                             color: Colors.black12, size: 15.sp),
                                       ],
                                     ),
                                   ],
                                 ),

                                 // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                               ],
                             ),
                           ],
                         ),
                       );
                     }
                   ),
                 ),
               ),


              // SizedBox(
              //   height: 2.h,
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => DetailsScreen()));
              //   },
              //   child: Container(
              //     height: 15.h,
              //     width: double.infinity,
              //     margin: EdgeInsets.only(left: 4.w, right: 4.w),
              //     padding: EdgeInsets.only(left: 4.w, top: 2.5.h, right: 2.w),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(2.h),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Color(0xff000000).withOpacity(0.10),
              //           blurRadius: 4, // soften the shadow
              //           spreadRadius: 0, //extend the shadow
              //           offset: Offset(
              //             0, // Move to right 10  horizontally
              //             4, // Move to bottom 10 Vertically
              //           ),
              //         )
              //       ],
              //     ),
              //     child: Column(
              //       children: [
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Stack(
              //               children: [
              //                 Image.asset(
              //                   'assets/images/profile_icon1.png',
              //                   height: 9.h,
              //                   width: 9.h,
              //                 ),
              //                 Padding(
              //                     padding:
              //                         EdgeInsets.only(top: 6.h, left: 10.w),
              //                     child: Image.asset(
              //                       'assets/images/mail.png',
              //                       height: 4.h,
              //                     ))
              //               ],
              //             ),
              //             SizedBox(
              //               width: 2.w,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   'Micael Garcia',
              //                   style: GoogleFonts.inter(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 12.sp),
              //                 ),
              //                 Row(
              //                   children: [
              //                     Text(
              //                       '1min',
              //                       style: GoogleFonts.inter(
              //                           color: Color(0xff7B7B7D),
              //                           fontSize: 7.sp),
              //                     ),
              //                     SizedBox(
              //                       width: 1.w,
              //                     ),
              //                     Icon(
              //                       Icons.history,
              //                       size: 10.sp,
              //                       color: Color(0xff7B7B7D),
              //                     )
              //                   ],
              //                 ),
              //                 Container(
              //                   width: 60.w,
              //                   // color: Colors.blue,
              //                   child: Text(
              //                     'Interested in the Rolex Yacht-Master II, Is it still available?',
              //                     style: GoogleFonts.inter(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: 8.sp),
              //                   ),
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     SizedBox(
              //                       width: 40.w,
              //                     ),
              //                     Icon(
              //                       Icons.delete_outline,
              //                       color: Colors.black12,
              //                       size: 15.sp,
              //                     ),
              //                     SizedBox(
              //                       width: 2.w,
              //                     ),
              //                     Icon(Icons.visibility_off_outlined,
              //                         color: Colors.black12, size: 15.sp),
              //                     SizedBox(
              //                       width: 2.w,
              //                     ),
              //                     Icon(Icons.messenger_outline,
              //                         color: Colors.black12, size: 15.sp),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //
              //             // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   height: 15.h,
              //   width: double.infinity,
              //   margin: EdgeInsets.only(left: 4.w, right: 4.w),
              //   padding: EdgeInsets.only(left: 4.w, top: 2.5.h, right: 2.w),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(2.h),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0xff000000).withOpacity(0.10),
              //         blurRadius: 4, // soften the shadow
              //         spreadRadius: 0, //extend the shadow
              //         offset: Offset(
              //           0, // Move to right 10  horizontally
              //           4, // Move to bottom 10 Vertically
              //         ),
              //       )
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children: [
              //               Image.asset(
              //                 'assets/images/profile_icon2.png',
              //                 height: 9.h,
              //                 width: 9.h,
              //               ),
              //               Padding(
              //                   padding: EdgeInsets.only(top: 6.h, left: 10.w),
              //                   child: Image.asset(
              //                     'assets/images/mail.png',
              //                     height: 4.h,
              //                   ))
              //             ],
              //           ),
              //           SizedBox(
              //             width: 2.w,
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Dan Rodriguez',
              //                 style: GoogleFonts.inter(
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 12.sp),
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     '1min',
              //                     style: GoogleFonts.inter(
              //                         color: Color(0xff7B7B7D), fontSize: 7.sp),
              //                   ),
              //                   SizedBox(
              //                     width: 1.w,
              //                   ),
              //                   Icon(
              //                     Icons.history,
              //                     size: 10.sp,
              //                     color: Color(0xff7B7B7D),
              //                   )
              //                 ],
              //               ),
              //               Container(
              //                 width: 60.w,
              //                 // color: Colors.blue,
              //                 child: Text(
              //                   'In-stock status of 40mm Rolex Explorer?',
              //                   style: GoogleFonts.inter(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 8.sp),
              //                 ),
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   SizedBox(
              //                     width: 40.w,
              //                   ),
              //                   Icon(
              //                     Icons.delete_outline,
              //                     color: Colors.black12,
              //                     size: 15.sp,
              //                   ),
              //                   SizedBox(
              //                     width: 2.w,
              //                   ),
              //                   Icon(Icons.visibility_off_outlined,
              //                       color: Colors.black12, size: 15.sp),
              //                   SizedBox(
              //                     width: 2.w,
              //                   ),
              //                   Icon(Icons.messenger_outline,
              //                       color: Colors.black12, size: 15.sp),
              //                 ],
              //               ),
              //             ],
              //           ),
              //
              //           // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   height: 15.h,
              //   width: double.infinity,
              //   margin: EdgeInsets.only(left: 4.w, right: 4.w),
              //   padding: EdgeInsets.only(left: 4.w, top: 2.5.h, right: 2.w),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(2.h),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0xff000000).withOpacity(0.10),
              //         blurRadius: 4, // soften the shadow
              //         spreadRadius: 0, //extend the shadow
              //         offset: Offset(
              //           0, // Move to right 10  horizontally
              //           4, // Move to bottom 10 Vertically
              //         ),
              //       )
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children: [
              //               Image.asset(
              //                 'assets/images/profile_icon3.png',
              //                 height: 9.h,
              //                 width: 9.h,
              //               ),
              //               Padding(
              //                   padding: EdgeInsets.only(top: 6.h, left: 10.w),
              //                   child: Image.asset(
              //                     'assets/images/mail.png',
              //                     height: 4.h,
              //                   ))
              //             ],
              //           ),
              //           SizedBox(
              //             width: 2.w,
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Ethan Taylor',
              //                 style: GoogleFonts.inter(
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 12.sp),
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     '1min',
              //                     style: GoogleFonts.inter(
              //                         color: Color(0xff7B7B7D), fontSize: 7.sp),
              //                   ),
              //                   SizedBox(
              //                     width: 1.w,
              //                   ),
              //                   Icon(
              //                     Icons.history,
              //                     size: 10.sp,
              //                     color: Color(0xff7B7B7D),
              //                   )
              //                 ],
              //               ),
              //               Container(
              //                 width: 60.w,
              //                 // color: Colors.blue,
              //                 child: Text(
              //                   'In-stock status of 40mm Rolex Explorer?',
              //                   style: GoogleFonts.inter(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 8.sp),
              //                 ),
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   SizedBox(
              //                     width: 40.w,
              //                   ),
              //                   Icon(
              //                     Icons.delete_outline,
              //                     color: Colors.black12,
              //                     size: 15.sp,
              //                   ),
              //                   SizedBox(
              //                     width: 2.w,
              //                   ),
              //                   Icon(Icons.visibility_off_outlined,
              //                       color: Colors.black12, size: 15.sp),
              //                   SizedBox(
              //                     width: 2.w,
              //                   ),
              //                   Icon(Icons.messenger_outline,
              //                       color: Colors.black12, size: 15.sp),
              //                 ],
              //               ),
              //             ],
              //           ),
              //
              //           // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   height: 15.h,
              //   width: double.infinity,
              //   margin: EdgeInsets.only(left: 4.w, right: 4.w),
              //   padding: EdgeInsets.only(left: 4.w, top: 2.5.h, right: 2.w),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(2.h),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0xff000000).withOpacity(0.10),
              //         blurRadius: 4, // soften the shadow
              //         spreadRadius: 0, //extend the shadow
              //         offset: Offset(
              //           0, // Move to right 10  horizontally
              //           4, // Move to bottom 10 Vertically
              //         ),
              //       )
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children: [
              //               Image.asset(
              //                 'assets/images/profile_icon4.png',
              //                 height: 9.h,
              //                 width: 9.h,
              //               ),
              //               Padding(
              //                   padding: EdgeInsets.only(top: 6.h, left: 10.w),
              //                   child: Image.asset(
              //                     'assets/images/mail.png',
              //                     height: 4.h,
              //                   ))
              //             ],
              //           ),
              //           SizedBox(
              //             width: 2.w,
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Sophia Patel',
              //                 style: GoogleFonts.inter(
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 12.sp),
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     '1min',
              //                     style: GoogleFonts.inter(
              //                         color: Color(0xff7B7B7D), fontSize: 7.sp),
              //                   ),
              //                   SizedBox(
              //                     width: 1.w,
              //                   ),
              //                   Icon(
              //                     Icons.history,
              //                     size: 10.sp,
              //                     color: Color(0xff7B7B7D),
              //                   )
              //                 ],
              //               ),
              //               Container(
              //                 width: 60.w,
              //                 // color: Colors.blue,
              //                 child: Text(
              //                   'Hi, is the Rolex Lady-Datejust Oyster in Everose gold still available?',
              //                   style: GoogleFonts.inter(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 8.sp),
              //                 ),
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   SizedBox(
              //                     width: 40.w,
              //                   ),
              //                   Icon(
              //                     Icons.delete_outline,
              //                     color: Colors.black12,
              //                     size: 15.sp,
              //                   ),
              //                   SizedBox(
              //                     width: 2.w,
              //                   ),
              //                   Icon(Icons.visibility_off_outlined,
              //                       color: Colors.black12, size: 15.sp),
              //                   SizedBox(
              //                     width: 2.w,
              //                   ),
              //                   Icon(Icons.messenger_outline,
              //                       color: Colors.black12, size: 15.sp),
              //                 ],
              //               ),
              //             ],
              //           ),
              //
              //           // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),

    );
  }
}
