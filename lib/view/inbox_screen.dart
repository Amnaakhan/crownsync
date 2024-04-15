
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/details_screen.dart';
import 'package:mobiledesign/view/email_preview.dart';
import 'package:sizer/sizer.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with TickerProviderStateMixin {
  int _activeIndex = 0;
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 7.h, ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5.w,right: 5.w ),

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
                            height: 6.h,
                            width: 6.h,

                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 3.w, right: 3.w, bottom: 1.h),
                                child: Image.asset(
                                  'assets/images/settings.png',
                                )),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Container(
                            height: 6.h,
                            width: 6.h,

                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.h),
                                child: Image.asset(
                                  'assets/images/profile.png',
                                )),
                          ),
                        ],
                      ),

                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 6.h,
                            width: 55.w,
                            padding: EdgeInsets.only(right: 2.w),
                            decoration: BoxDecoration(
                                color: Color(0xff4D4D4D),
                                borderRadius: BorderRadius.circular(4.h)),
                            child: Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 4.h,
                                          width: 4.h,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF4DC5A),
                                              shape: BoxShape.circle),
                                          child: Center(child: Image.asset('assets/images/img.png')),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2.h,left: 5.w),
                                            child: Image.asset('assets/images/mail.png',height: 2.5.h,)),

                                      ],

                                    ),

                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      'info@manfredije...',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 10.sp),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Image.asset(
                                      'assets/images/drop_arrow.png',
                                      height: 1.h,
                                    )
                                  ],
                                ))),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                            height: 6.h,
                            width: 30.w,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(4.h),
                              border: Border.all(color: Color(0xff4D4D4D),)
                            ),
                            child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 2.w,
                                    ),

                                    Text(
                                      'Filter',
                                      style: GoogleFonts.inter(
                                          color: Color(0xff4D4D4D),
                                          fontSize: 11.sp),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        // Show filter options dialog or bottom sheet
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Filter Options'),
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    // Add input fields or date pickers for filter criteria
                                                    // For example:
                                                    TextField(
                                                      decoration: InputDecoration(labelText: 'Search something '),
                                                      onChanged: (value) {
                                                        // Update filter criteria based on entered name
                                                      },
                                                    ),
                                                    SizedBox(height: 20),
                                                    // Add date pickers for selecting start and end dates
                                                    // For example:


                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    // searchEmails(); // Assuming you have a function named searchEmails for searching emails

                                                    // Apply filters and update displayed emails
                                                    // You can call a function here to filter emails based on the criteria
                                                  },
                                                  child: Text('Apply'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset(
                                        'assets/images/filter.png',
                                        height: 3.h,
                                        color: Color(0xff4D4D4D),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                  ],
                                ))),
                      ],
                    )





                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsScreen()));
                },
                child: Container(
                  height: 15.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 4.w,right: 4.w),
                  padding: EdgeInsets.only(left: 4.w,top: 2.5.h,right: 2.w),

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
                        Image.asset('assets/images/profile_icon.png',height: 9.h,width: 9.h,),
                        Padding(
                         padding: EdgeInsets.only(top: 6.h,left: 10.w),
                            child: Image.asset('assets/images/mail.png',height: 4.h,))
                      ],

                    ),
                       SizedBox(width: 2.w,),
                      Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                           Text('Puja Lopez', style: GoogleFonts.inter(
                               color: Colors.black,
                               fontWeight: FontWeight.w500,
                               fontSize: 12.sp),),
                           Row(
                             children: [
                               Text('1min', style: GoogleFonts.inter(
                                   color: Color(0xff7B7B7D),
                                   fontSize: 7.sp),),
                               SizedBox(width: 1.w,),
                               Icon(Icons.history,size: 10.sp,color: Color(0xff7B7B7D),)
                             ],
                           ),
                             Container(
                               width: 60.w,
                               // color: Colors.blue,
                               child: Text('I m interested in the Rolex Oyster Perpetual 31, is it still available?', style: GoogleFonts.inter(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 8.sp),),
                             ),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(width: 40.w,),

                               Icon(Icons.delete_outline,color: Colors.black12,size: 15.sp,),

                               SizedBox(width: 2.w,),
                               Icon(Icons.visibility_off_outlined,color: Colors.black12,size: 15.sp),
                               SizedBox(width: 2.w,),

                               Icon(Icons.messenger_outline,color: Colors.black12,size: 15.sp),


                             ],
                           ),

                           ],),

                       // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                   ],),
                 ],
                  ),
                ),
              ),



              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsScreen()));
                },
                child: Container(
                  height: 15.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 4.w,right: 4.w),
                  padding: EdgeInsets.only(left: 4.w,top: 2.5.h,right: 2.w),

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
                              Image.asset('assets/images/profile_icon1.png',height: 9.h,width: 9.h,),
                              Padding(
                                  padding: EdgeInsets.only(top: 6.h,left: 10.w),
                                  child: Image.asset('assets/images/mail.png',height: 4.h,))
                            ],

                          ),
                          SizedBox(width: 2.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Micael Garcia', style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),),
                              Row(
                                children: [
                                  Text('1min', style: GoogleFonts.inter(
                                      color: Color(0xff7B7B7D),
                                      fontSize: 7.sp),),
                                  SizedBox(width: 1.w,),
                                  Icon(Icons.history,size: 10.sp,color: Color(0xff7B7B7D),)
                                ],
                              ),
                              Container(
                                width: 60.w,
                                // color: Colors.blue,
                                child: Text('Interested in the Rolex Yacht-Master II, Is it still available?', style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8.sp),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 40.w,),

                                  Icon(Icons.delete_outline,color: Colors.black12,size: 15.sp,),

                                  SizedBox(width: 2.w,),
                                  Icon(Icons.visibility_off_outlined,color: Colors.black12,size: 15.sp),
                                  SizedBox(width: 2.w,),

                                  Icon(Icons.messenger_outline,color: Colors.black12,size: 15.sp),


                                ],
                              ),

                            ],),

                          // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                        ],),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 15.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 2.5.h,right: 2.w),

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
                            Image.asset('assets/images/profile_icon2.png',height: 9.h,width: 9.h,),
                            Padding(
                                padding: EdgeInsets.only(top: 6.h,left: 10.w),
                                child: Image.asset('assets/images/mail.png',height: 4.h,))
                          ],

                        ),
                        SizedBox(width: 2.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Dan Rodriguez', style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),),
                            Row(
                              children: [
                                Text('1min', style: GoogleFonts.inter(
                                    color: Color(0xff7B7B7D),
                                    fontSize: 7.sp),),
                                SizedBox(width: 1.w,),
                                Icon(Icons.history,size: 10.sp,color: Color(0xff7B7B7D),)
                              ],
                            ),
                            Container(
                              width: 60.w,
                              // color: Colors.blue,
                              child: Text('In-stock status of 40mm Rolex Explorer?', style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8.sp),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 40.w,),

                                Icon(Icons.delete_outline,color: Colors.black12,size: 15.sp,),

                                SizedBox(width: 2.w,),
                                Icon(Icons.visibility_off_outlined,color: Colors.black12,size: 15.sp),
                                SizedBox(width: 2.w,),

                                Icon(Icons.messenger_outline,color: Colors.black12,size: 15.sp),


                              ],
                            ),

                          ],),

                        // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                      ],),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 15.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 2.5.h,right: 2.w),

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
                            Image.asset('assets/images/profile_icon3.png',height: 9.h,width: 9.h,),
                            Padding(
                                padding: EdgeInsets.only(top: 6.h,left: 10.w),
                                child: Image.asset('assets/images/mail.png',height: 4.h,))
                          ],

                        ),
                        SizedBox(width: 2.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Ethan Taylor', style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),),
                            Row(
                              children: [
                                Text('1min', style: GoogleFonts.inter(
                                    color: Color(0xff7B7B7D),
                                    fontSize: 7.sp),),
                                SizedBox(width: 1.w,),
                                Icon(Icons.history,size: 10.sp,color: Color(0xff7B7B7D),)
                              ],
                            ),
                            Container(
                              width: 60.w,
                              // color: Colors.blue,
                              child: Text('In-stock status of 40mm Rolex Explorer?', style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8.sp),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 40.w,),

                                Icon(Icons.delete_outline,color: Colors.black12,size: 15.sp,),

                                SizedBox(width: 2.w,),
                                Icon(Icons.visibility_off_outlined,color: Colors.black12,size: 15.sp),
                                SizedBox(width: 2.w,),

                                Icon(Icons.messenger_outline,color: Colors.black12,size: 15.sp),


                              ],
                            ),

                          ],),

                        // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                      ],),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 15.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 4.w,top: 2.5.h,right: 2.w),

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
                            Image.asset('assets/images/profile_icon4.png',height: 9.h,width: 9.h,),
                            Padding(
                                padding: EdgeInsets.only(top: 6.h,left: 10.w),
                                child: Image.asset('assets/images/mail.png',height: 4.h,))
                          ],

                        ),
                        SizedBox(width: 2.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Sophia Patel', style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),),
                            Row(
                              children: [
                                Text('1min', style: GoogleFonts.inter(
                                    color: Color(0xff7B7B7D),
                                    fontSize: 7.sp),),
                                SizedBox(width: 1.w,),
                                Icon(Icons.history,size: 10.sp,color: Color(0xff7B7B7D),)
                              ],
                            ),
                            Container(
                              width: 60.w,
                              // color: Colors.blue,
                              child: Text('Hi, is the Rolex Lady-Datejust Oyster in Everose gold still available?', style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8.sp),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 40.w,),

                                Icon(Icons.delete_outline,color: Colors.black12,size: 15.sp,),

                                SizedBox(width: 2.w,),
                                Icon(Icons.visibility_off_outlined,color: Colors.black12,size: 15.sp),
                                SizedBox(width: 2.w,),

                                Icon(Icons.messenger_outline,color: Colors.black12,size: 15.sp),


                              ],
                            ),

                          ],),

                        // Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                      ],),
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
