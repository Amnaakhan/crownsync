import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/inbox_screen.dart';
import 'package:mobiledesign/view/setting_screen.dart';
import 'package:sizer/sizer.dart';

class LayoutScreen extends StatefulWidget {
  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          InboxScreen(),
          SettingScreen(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        backgroundColor: Colors.black,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
              icon: Image.asset('assets/images/home_icon1.png',color: Colors.white,height: 3.h,),
              title: Text('Home',style: GoogleFonts.inter(),),
              // backgroundColorOpacity: 0.20,
              activeColor: Color(0xff434343),
activeTitleColor: Colors.white,
              activeIconColor: Colors.black,
              inactiveColor: Colors.white,
              inactiveIcon: Image.asset('assets/images/home_icon.png',color: Colors.white,height: 3.h,)

            // activeTitleColor: Colors.blue.shade600,
          ),
          BottomBarItem(
              icon: Image.asset('assets/images/inbox1.png',color: Colors.white,height: 3.h,),
              title: Text('Inbox',style: GoogleFonts.inter(),),
              // backgroundColorOpacity: 0.20,
            activeColor: Color(0xff434343),
              activeTitleColor: Colors.white,

              activeIconColor: Colors.black,
              inactiveColor: Colors.white,
              inactiveIcon:  Image.asset('assets/images/inbox.png',color: Colors.white,height: 3.h,),

          ),
          BottomBarItem(
            icon: Image.asset('assets/images/send1.png',color: Colors.white,height: 3.h,),
            title: Text('Send',style: GoogleFonts.inter(),),
            // backgroundColorOpacity: 0.20,
            activeColor: Color(0xff434343),
              activeTitleColor: Colors.white,

            activeIconColor: Colors.black,
            inactiveColor: Colors.white,
            inactiveIcon:Image.asset('assets/images/send.png',color: Colors.white,height: 3.h,),

          ),
          BottomBarItem(
              icon: Image.asset('assets/images/setting.png',color: Colors.white,height: 3.h,),
              title: Text('Setting',style: GoogleFonts.inter(),),
              // backgroundColorOpacity: 0.20,
            activeColor: Color(0xff434343),
              activeTitleColor: Colors.white,

              activeIconColor: Colors.black,
              inactiveColor: Colors.white,
              inactiveIcon: Image.asset('assets/images/setting1.png',color: Colors.white,height: 3.h,),
            // activeTitleColor: Colors.orange.shade700,
          ),
        ],
      ),
    );
  }
}