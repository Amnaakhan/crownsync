import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class EmailPreview extends StatefulWidget {
  const EmailPreview({super.key});

  @override
  State<EmailPreview> createState() => _EmailPreviewState();
}

class _EmailPreviewState extends State<EmailPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:

   Column(
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
                        'EmailPreview',
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
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Container(
                      height: 6.h,
                      width: 41.w,
                      padding: EdgeInsets.only(right: 1.w),
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
                                      padding: EdgeInsets.only(top: 2.5.h,left: 5.w),
                                      child: Image.asset('assets/images/mail.png',height: 2.h,)),

                                ],

                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                'info@manfredije...',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 7.sp),
                              ),
                              SizedBox(
                                width: 1.w,
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
                      height: 8.h,
                      width: 49.w,
                      padding: EdgeInsets.only(left: 1.w,right: 1.w),
                      decoration: BoxDecoration(
    color: Colors.white,
                          borderRadius: BorderRadius.circular(1.h),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.20),
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
                          Text('From: Darla Jo Brown <darlajo@manfredijewels.com>'
                              ' Date: March 3, 2024 at 10:17:20 PM EST To:'
                              ' Pujalopez@micaelaerlanger.comSubject: Manfredi Jewels-Oyster Perpetual 31',style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 7.sp),)
                        ],
                      )
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 2.h,),
        Container(height: 62.h,
          width: double.infinity,
          margin: EdgeInsets.only(left: 2.w,right: 2.w),
          padding: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),

          decoration: BoxDecoration(
            color: Colors.white,
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
            borderRadius: BorderRadius.circular(1.h)

          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dear Puja,Good evening. Thank you for your'
            ' inquiry.My name is Darla Jo Brown.I am the store manager'
            ' at Manfredi Jewels and have been selling Rolex watches for'
            'over twenty years. Our store is located in the charming town'
            ' of New Canaan, CT.There are beautiful shops, delicious'
            ' restaurants and lovely surrounding parks.Please feel'
            ' free to stop in our store if you are in the area. '
            'I would love to show you our collection of Rolex watches.'
            'I see you are interested in the Rolex Oyster Perpetual 31, '
                'reference #M277200-0001. That is one of my favorite'
                ' new Rolex watches. The sunray finish creates delicate'
                ' light reflections on many dials in the Oyster Perpetual'
                ' collection. It is obtained using masterful brushing'
                     ' techniques that create grooves running outwards from the center of the dial'
                ,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 10.sp),),
                Text('https://www.rolex.com/en-us/watches/oyster-perpetual/m277200-0001',
                    style: GoogleFonts.inter(
                    color: Colors.blue,
                    fontSize: 10.sp)),
                SizedBox(height: 2.h,),
            Image.asset('assets/images/img1.png'),
                SizedBox(height: 2.h,),

                Text('We do not have this model in stock for'
                    ' sale at the moment. However, you will be'
                    ' happy to know we currently do have the Rolex'
                    ' Oyster Perpetual in our collection of exhibition watches.'
                    ' I would love to set up an appointment for you to'
                    ' try this model on and register your interest for'
                    ' this watch in person.If you would like to view other'
                    ' options, please feel free to peruse Rolex.com and'
                    ' use the configurator to view the other options of'
                    ' this model. If you are interested in exploring'
                    ' the Rolex brand, you can also visit '
                    'https://www.rolex.org/. If you would like further information,'
                    ' I am happy to send you a current catalog via U.S. mail.'
                    ' If you have any other questions, please do not hesitate to call.'
                    ' I am here to assist you with any concerns you may have.'
                    ' Again, I look forward to making your acquaintance in our New'
                    ' Canaan store in the near future and can register your interest at that time.'
                    'Have a nice evening.'
                  ,
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 10.sp),),
                SizedBox(height: 5.h,),
                Text('Best Regards,' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 10.sp)),
                Text('Darla Jo Brown' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,

                        fontSize: 10.sp)),
                Text('Manager' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp)),
                Text('Manfredi Jewels' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 10.sp)),
                Text('72 Elm Street' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 10.sp)),
                Text('New Canaan, CT 06840' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 10.sp)),
                Text('2039668705' ,
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 10.sp)),
                Text('https://g.page/ManfrediNewCanaan/review' ,
                    style: GoogleFonts.inter(
                        color: Colors.blue,
                        fontSize: 10.sp))








              ],
            ),
          ),
          ),
        SizedBox(height: 2.h,),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(height: 7.h,
            width: double.infinity,
              margin: EdgeInsets.only(left: 5.w,right: 5.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.h)
              ),
              child: Center(
                child: Text(
                  'Send',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,

                        fontSize: 20.sp)
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h,)
      ],
    ),


    );
  }
}
