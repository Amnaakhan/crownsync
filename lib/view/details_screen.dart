import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/email_preview.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 25.h,
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
                        Container(
                          height: 6.h,
                          width: 6.h,

                          child: Padding(
                              padding:
                              EdgeInsets.only(left: 3.w, right: 3.w,top: 1.h),
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
                              EdgeInsets.only(top: 1.h),
                              child: Image.asset(
                                'assets/images/profile.png',height: 4.h,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h,),
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
                                          fontSize: 11.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
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
                                  children: [
                                    SizedBox(
                                      width: 2.w,
                                    ),

                                    Text(
                                      'Assigned',
                                      style: GoogleFonts.inter(
                                          color: Color(0xff4D4D4D),
                                          fontSize: 11.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Image.asset(
                                      'assets/images/drop_arrow.png',
                                      height: 1.h,
                                      color: Color(0xff4D4D4D),
                                    )
                                  ],
                                ))),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 15.h,
                width: double.infinity,
                margin: EdgeInsets.only(left: 4.w,right: 4.w),
                padding: EdgeInsets.only(left: 5.w,top: 1.h,right: 2.w),

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
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/profile_icon.png',height: 6.h,),
                            Padding(
                                padding: EdgeInsets.only(top: 4.h,left: 7.w),
                                child: Image.asset('assets/images/mail.png',height: 3.h,))
                          ],

                        ),
                        SizedBox(width: 1.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Puja Lopez', style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),),
                            Row(
                              children: [
                                Text('1min', style: GoogleFonts.inter(
                                    color: Color(0xff7B7B7D),
                                    fontSize: 8.sp),),
                                SizedBox(width: 1.w,),
                                Icon(Icons.history,size: 10.sp,color: Color(0xff7B7B7D),)
                              ],
                            ),
                            Container(
                              width: 66.w,
                              // color: Colors.blue,
                              child: Text('I m interested in the Rolex Oyster Perpetual 31, is it still available?', style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp),),
                            ),

                          ],),
                        Icon(Icons.more_vert,size: 12.sp,color: Color(0xff7B7B7D))
                      ],),
                    Image.asset('assets/images/row.png')
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 10.h,
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
                      'Initial Greeting/Ending Greeting',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                           fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        height: 3.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                          border: Border.all(color: Color(0xff000000).withOpacity(0.60))

                        ),
                        child: Center(child: Text('Morning',style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp),),),
                      ),
                      Container(
                        height: 3.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            border: Border.all(color: Color(0xff000000).withOpacity(0.60))

                        ),
                        child: Center(child: Text('Afternoon',style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp),),),
                      ),
                      Container(
                        height: 3.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: Color(0xff000000),
                            borderRadius: BorderRadius.circular(1.h),

                        ),
                        child: Center(child: Text('Evening',style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,

                            fontSize: 10.sp),),),

                      )
                    ],)
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 10.h,
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
                      'Initial Greeting/Ending Greeting',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),


                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 10.h,
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
                          fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 3.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            color: Color(0xff000000),
                            borderRadius: BorderRadius.circular(1.h),

                          ),
                          child: Center(child: Text('New Canaan,CT',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,

                              fontSize: 9.sp),),),
                        ),
                        Container(
                          height: 3.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(color: Color(0xff000000).withOpacity(0.60))

                          ),
                          child: Center(child: Text('Greenwich,CT',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp),),),
                        ),
                        Container(
                          height: 3.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(color: Color(0xff000000).withOpacity(0.60))
                          ),
                          child: Center(child: Text('New York,NY',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,

                              fontSize: 10.sp),),),

                        )
                      ],)
                  ],
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 10.h,
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
                          fontSize: 13.sp),
                    ),
                    SizedBox(height: 1.h,),
                    Container(
                      height: 4.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 4.w,right: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        border: Border.all(color: Color(0xff000000).withOpacity(0.60),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select an option',style: GoogleFonts.inter(
                              fontSize: 12.sp,
                            color: Color(0xff828282)
                          ),),
        Image.asset('assets/images/drop_arrow.png', color: Color(0xff828282),height: 1.5.h,)
                        ],
                      ),
                    )


                  ],
                ),
              ),
              SizedBox(height: 2.h,),

              Container(
                height: 10.h,
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
                      'Model number',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp),
                    ),
                    SizedBox(height: 1.h,),
                    Container(
                      height: 4.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 4.w,right: 4.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                          border: Border.all(color: Color(0xff000000).withOpacity(0.60),
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select an option',style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: Color(0xff828282)
                          ),),
                          Image.asset('assets/images/drop_arrow.png', color: Color(0xff828282),height: 1.5.h,)
                        ],
                      ),
                    )


                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 10.h,
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
                      'Inventory level',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    SizedBox(height: 1.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 3.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            border: Border.all(color: Color(0xff000000).withOpacity(0.60))
                          ),
                          child: Center(child: Text('In Stock',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,

                              fontSize: 9.sp),),),
                        ),

                        Container(
                          height: 3.h,
                          width: 40.w,
                          decoration: BoxDecoration(

                            color: Color(0xff000000),
                            borderRadius: BorderRadius.circular(1.h),

                          ),
                          child: Center(child: Text('Out Of Stock',style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,

                              fontSize: 10.sp),),),

                        )
                      ],)
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
                      color: Colors.black,
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
              SizedBox(height: 2.h,)




            ],
          ),
      ),

    );
  }
}
class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? _selectedItem;

  // List of dropdown items
  List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Center(
      child: Container(
        height: 5.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color here
          ),
          borderRadius: BorderRadius.circular(5.0), // Optional: for rounded borders
        ),
        child:DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _selectedItem,
            items: _dropdownItems.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? selectedItem) {
              setState(() {
                _selectedItem = selectedItem;
              });
            },
            hint: Text('Select an item'),
          ),
        )
      )
    ),
    );
  }
}