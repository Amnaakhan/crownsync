import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobiledesign/view/Controller/auth_controller.dart';
import 'package:mobiledesign/view/Controller/getcontroller.dart';
import 'package:mobiledesign/view/details_screen.dart';
import 'package:sizer/sizer.dart';

class InboxScreen extends StatefulWidget {

  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}
bool isSearchVisible = false;
class _InboxScreenState extends State<InboxScreen>
    with TickerProviderStateMixin {
  int _activeIndex = 0;
  late TabController _tabController;
  List<Map<String, dynamic>> emailMessages = [];
  bool isLoading = true;
  List<Map<String, dynamic>> filteredEmailMessages = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserList();
    fetchEmailMessages();
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

  Future<void> fetchUserList() async {
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
        List<String> emailList = [];
        for (var user in data['data']) {
          emailList.add(user['user_email']);
        }
        setState(() {
          emails = emailList;
        });
        print('userlist ${emails}');
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      print('Error fetching user list: $e');
      // Handle error here
    }
  }

  Future<void> fetchEmailMessages() async {
    String? token = await AuthController().getToken();
    print('usertoken $token');
    try {
      final response = await http.get(
        Uri.parse('https://api.crownsync.ai/api/email-messages'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          emailMessages = List<Map<String, dynamic>>.from(jsonData['data']);
          filteredEmailMessages =
              List<Map<String, dynamic>>.from(jsonData['data']);
          filterEmailsByDate();
          isLoading = false;
        });
      } else {
        print('Failed to load email messages');
        isLoading = false;
      }
    } catch (e) {
      print('Exception: $e');
      isLoading = false;
    }
  }


  //filter emails
  void _filterEmails(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredEmailMessages = emailMessages.where((email) {
          final detail = json.decode(email['detail']);
          final fromField =
              _parseField(detail['headers'], 'From').toLowerCase();
          final subject =
              _parseField(detail['headers'], 'Subject').toLowerCase();
          return fromField.contains(query.toLowerCase()) ||
              subject.contains(query.toLowerCase());
        }).toList();
      } else {
        filteredEmailMessages = List.from(emailMessages);
      }
    });
  }

  String _parseField(Map<String, dynamic> headers, String fieldName) {
    String fieldValue = headers[fieldName] ?? 'Unknown';
    if (fieldName == 'From' || fieldName == 'To') {
      // Remove the email part from the field value
      int emailStartIndex = fieldValue.lastIndexOf('<');
      int emailEndIndex = fieldValue.lastIndexOf('>');
      if (emailStartIndex != -1 && emailEndIndex != -1) {
        fieldValue = fieldValue.substring(0, emailStartIndex).trim();
      }
    }
    if (fieldName == 'Date') {
      // Remove any unnecessary text from the date field
      int commaIndex = fieldValue.indexOf(',');
      if (commaIndex != -1) {
        fieldValue = fieldValue.substring(commaIndex + 1).trim();
      }
    }
    return fieldValue;
  }

//for date ranges search
  DateTime? startDate;
  DateTime? endDate;
  Future<void> selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),  // Adjust based on your requirement
      lastDate: DateTime.now(),
      initialDateRange: startDate != null && endDate != null
          ? DateTimeRange(start: startDate!, end: endDate!)
          : null,
    );

    if (picked != null && picked.start != startDate && picked.end != endDate) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
        filterEmailsByDate();
      });
    }
  }
  void filterEmailsByDate() {
    if (startDate == null || endDate == null) return;

    DateTime endOfDay = DateTime(endDate!.year, endDate!.month, endDate!.day, 23, 59, 59);

    List<Map<String, dynamic>> newFilteredEmails = emailMessages.where((email) {
      Map<String, dynamic> detail = json.decode(email['detail']);
      var dateFormatter = DateFormat('EEE, dd MMM yyyy');
      DateTime emailDate = dateFormatter.parse(detail['headers']['Date']);
      return emailDate.isAfter(startDate!.subtract(const Duration(days: 1))) &&
          emailDate.isBefore(endOfDay.add(const Duration(days: 1)));
    }).toList();

    setState(() {
      filteredEmailMessages = newFilteredEmails;
      isLoading = false;
    });
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
    return Scaffold(
      body: Padding(
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
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                      ),
                      Spacer(),
                      apiController.loginModel?.data?.contact == null
                          ? Container()
                          : Container(
                              height: 5.h,
                              width: 71.w,
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
                                    '${apiController.loginModel?.data?.contact}',
                                    style: GoogleFonts.inter(
                                        color: Colors.grey, fontSize: 10.sp),
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
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: () {
                          selectDateRange(context);
                        },
                        child: Container(
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
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSearchVisible = !isSearchVisible;
                          });
                        },
                        child: Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                              color: isSearchVisible
                                  ? Color(0xffE2545E)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(
                                color: isSearchVisible
                                    ? Color(0xffE2545E)
                                    : Color(0xff4D4D4D),
                              )),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: isSearchVisible
                                  ? Colors.white
                                  : Color(0xff4D4D4D),
                            ),
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
                          child: Icon(Icons.check_circle_outline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),



                  Visibility(
                    visible: isSearchVisible,
                    child: Container(
                      height: 5.5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: _filterEmails,
                        cursorWidth: 0.3.w,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 1.h, left: 2.w, right: 2.w, bottom: 1.h),
                            child: Image.asset(
                              "assets/images/search.png",
                              height: 3.h,
                              width: 6.w,
                            ),
                          ),
                          hintText: "Search...",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp),
                          contentPadding: EdgeInsets.only(
                            left: 20,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : emailMessages.isEmpty
                      ? Center(
                          child: Text(
                            'Nothing to show',
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : filteredEmailMessages.isEmpty
                                      ? Center(child: Text('No emails found'))
                                      : ListView.builder(
                                          itemCount:
                                              filteredEmailMessages.length,
                                          itemBuilder: (context, index) {
                                            final email =
                                                filteredEmailMessages[index];
                                            final detail =
                                                json.decode(email['detail']);
                                            final fromField = _parseField(
                                                detail['headers'], 'From');
                                            final subject = _parseField(
                                                detail['headers'], 'Subject');
                                            return InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsScreen(
                                                              selectedemail:
                                                                  selectedEmail,
                                                            )));
                                              },
                                              child: Container(
                                                height: 16.h,
                                                width: double.infinity,
                                                margin: EdgeInsets.only(
                                                    left: 4.w,
                                                    right: 4.w,
                                                    top: 1.h,
                                                    bottom: 1.h),
                                                padding: EdgeInsets.only(
                                                    left: 4.w,
                                                    top: 2.5.h,
                                                    right: 2.w),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.h),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xff000000)
                                                          .withOpacity(0.10),
                                                      blurRadius:
                                                          4, // soften the shadow
                                                      spreadRadius:
                                                          0, //extend the shadow
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/profile_icon.png',
                                                              height: 9.h,
                                                              width: 9.h,
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            6.h,
                                                                        left: 10
                                                                            .w),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/mail.png',
                                                                  height: 4.h,
                                                                ))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${fromField}',
                                                              style: GoogleFonts.inter(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '${_parseField(detail['headers'], 'Date')}',
                                                                  style: GoogleFonts.inter(
                                                                      color: Color(
                                                                          0xff7B7B7D),
                                                                      fontSize:
                                                                          7.sp),
                                                                ),
                                                                SizedBox(
                                                                  width: 1.w,
                                                                ),
                                                                Icon(
                                                                  Icons.history,
                                                                  size: 10.sp,
                                                                  color: Color(
                                                                      0xff7B7B7D),
                                                                )
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 60.w,
                                                              // color: Colors.blue,
                                                              child: Text(
                                                                '${detail['headers']['Subject']}',
                                                                style: GoogleFonts.inter(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        8.sp),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 40.w,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .delete_outline,
                                                                  color: Colors
                                                                      .black12,
                                                                  size: 15.sp,
                                                                ),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                Icon(
                                                                    Icons
                                                                        .visibility_off_outlined,
                                                                    color: Colors
                                                                        .black12,
                                                                    size:
                                                                        15.sp),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                Icon(
                                                                    Icons
                                                                        .messenger_outline,
                                                                    color: Colors
                                                                        .black12,
                                                                    size:
                                                                        15.sp),
                                                              ],
                                                            ),
                                                          ],
                                                        ),

                                                        // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
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
