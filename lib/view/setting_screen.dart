import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiledesign/view/add_location.dart';
import 'package:mobiledesign/view/add_store.dart';
import 'package:mobiledesign/view/add_tempelet.dart';
import 'package:mobiledesign/view/add_user.dart';
import 'package:mobiledesign/view/password_settings.dart';
import 'package:mobiledesign/view/profile_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController(); // Step 1

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
      searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/images/profile_icon.png")),
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: const Color(0xffE2545E))),
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Text(
            "Settings",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5.h,
              width: 10.w,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 0.3,
                  blurRadius: 9,
                  offset: const Offset(0, 1), // Apply shadow only to bottom
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(
                        0.9), // Change the opacity value to adjust the shade
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    "assets/images/question.png",
                    height: 3.h,
                    width: 6.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 5.5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
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
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 7.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setSelectedIndex(0);
                      },
                      child: Container(
                        height: 4.5.h,
                        width: 27.w,
                        decoration: BoxDecoration(
                            color: selectedIndex == 0
                                ? const Color(0xffE2545E)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Account",
                            style: GoogleFonts.inter(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setSelectedIndex(1);
                      },
                      child: Container(
                        height: 4.5.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? const Color(0xffE2545E)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "About",
                            style: GoogleFonts.inter(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setSelectedIndex(2);
                      },
                      child: Container(
                        height: 4.5.h,
                        width: 39.w,
                        decoration: BoxDecoration(
                            color: selectedIndex == 2
                                ? const Color(0xffE2545E)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Privacy Terms",
                            style: GoogleFonts.inter(
                              color: selectedIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: selectedIndex == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            _buildAccountSettings(), // Use helper method to build account settings based on search
                      )
                    : Container(), // Hide content if not selected
              ),
              SizedBox(
                child: selectedIndex == 1
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 4.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About Us",
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Enhancing Communication Solutions",
                              style: GoogleFonts.inter(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "At CrownSync.AI, we're driven by the vision to streamline digital interactions worldwide. With our cutting-edge AI technology and intuitive platform, we provide an all-in-one solution for managing social media, emails, and online communication seamlessly. Our mission is to empower businesses and individuals with smart analytics, effortless account integration, and 24/7 support, ensuring your digital connections are more effective and meaningful.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Empowering Seamless Integration Across Multiple Platforms.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Streamline your digital channels with our easy, unified integration for efficient communication.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Harnessing the Power of AI for Smart Insights.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Leverage advanced AI analytics to uncover actionable insights, enhancing decision-making and driving growth.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InkWell(
                              onTap: () {
                                _launchUrl();
                              },
                              child: Text(
                                "Learn more about us...",
                                style: GoogleFonts.inter(
                                  color:
                                      const Color(0xffE2545E).withOpacity(0.7),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
              SizedBox(
                child: selectedIndex == 2
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Privacy Policy",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Interpretation and Definitions",
                              style: GoogleFonts.inter(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Interpretation",
                              style: GoogleFonts.inter(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Definitions",
                              style: GoogleFonts.inter(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "For the purposes of this Privacy Policy:",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Account means a unique account created for You to access our Service or parts of our Service.\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where control means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\nCompany (referred to as either the Company, 'We', 'Us' or 'Our' in this Agreement) refers to Crown Sync.\nCookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.\nCountry refers to: New Jersey, United States\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\nPersonal Data is any information that relates to an identified or identifiable individual.\nService refers to the Website.\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\nWebsite refers to Crown Sync, accessible from www.crownsync.ai\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InkWell(
                              onTap: () {
                                _launchUrlPrivacy();
                              },
                              child: Text(
                                "Learn more about Privacy Policy...",
                                style: GoogleFonts.inter(
                                  color:
                                      const Color(0xffE2545E).withOpacity(0.7),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAccountSettings() {
    // Method to build account settings based on search query
    List<Widget> widgets = [];
    // Assuming you have a list of account settings data
    List<String> accountSettings = [
      "Profile",
      "Users/Team",
      "Password Settings",
      "Store",
      "Template",
      'Location'
    ];

    // Filter data based on search query
    String query = searchController.text.toLowerCase();
    List<String> filteredSettings = accountSettings
        .where((setting) => setting.toLowerCase().contains(query))
        .toList();
    // Build widgets for filtered settings
    for (String setting in filteredSettings) {
      widgets.add(
        Column(
          children: [
            SizedBox(
              height: 8.h,
              child: InkWell(
                onTap: () {
                  // Handle tap on setting
                  // You can navigate to different screens or perform actions based on the setting
                  if (setting == "Profile") {
                    Get.to(const ProfileScreen());
                  } else if (setting == "Users/Team") {
                    Get.to(const AddUsers());
                  } else if (setting == "Password Settings") {
                    Get.to(const PasswordSettings());
                  }
                  else if (setting == "Store") {
                    Get.to(const AddStore());
                  }
                  else if (setting == "Template") {
                    Get.to(const CreateTemplete());
                  }
                  else if (setting == "Location") {
                    Get.to(const AddLocation());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Row(
                    children: [
                      Image.asset(
                        _getIconAsset(
                            setting), // Method to get icon asset based on setting
                        height: 4.h,
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        setting,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }


    return widgets;
  }

  String _getIconAsset(String setting) {
    // Method to return the icon asset path based on the setting
    switch (setting) {
      case "Profile":
        return "assets/images/people.png";
      case "Users/Team":
        return "assets/images/user.png";
      case "Password Settings":
        return "assets/images/locked-computer.png";
      case "Store":
        return "assets/images/home_icon.png";
      case "Template":
        return "assets/images/home_icon.png";
      case "Location":
        return "assets/images/location.png";
      default:
        return ""; // Return empty string if no matching setting found
    }
  }

  final Uri _url = Uri.parse('https://crownsync.ai/about-us');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _urlPrivacy = Uri.parse('https://crownsync.ai/privacy-policy');
  Future<void> _launchUrlPrivacy() async {
    if (!await launchUrl(_urlPrivacy)) {
      throw Exception('Could not launch $_url');
    }
  }
}
