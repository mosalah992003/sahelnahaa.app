import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/tashteba/arrow.dart';
import 'package:sahelnahaa/user/tashteba/custom_tashteba.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

// List of images to cycle through
final List<String> tashtebaPagesImages = [
  'assets/shop/card.png',
  'assets/shop/Card (1).png',
  "assets/shop/card (2).png",
  'assets/shop/Card (3).png',
  'assets/cards/card (4).png',
  'assets/images/card5.png',
];

class Tashteba extends StatefulWidget {
  const Tashteba({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TashtebaState createState() => _TashtebaState();
}

class _TashtebaState extends State<Tashteba> {
  int currentPageIndex = 0;

  void _goToNextPage() {
    setState(() {
      if (currentPageIndex < (tashtebaPagesImages.length / 2).floor()) {
        currentPageIndex++;
      }
    });
  }

  void _goToPreviousPage() {
    setState(() {
      if (currentPageIndex > 0) {
        currentPageIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the colors for the arrows based on the current page
    Color leftArrowColor = Colors.white;
    Color rightArrowColor = const Color(0xff207768);

    if (currentPageIndex == 1) {
      // Both arrows are green on page 2
      leftArrowColor = const Color(0xff207768);
      rightArrowColor = const Color(0xff207768);
    } else if (currentPageIndex == 2) {
      // Left arrow is green, right arrow is white on page 3
      leftArrowColor = const Color(0xff207768);
      rightArrowColor = Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(3.h),
            bottomRight: Radius.circular(3.h),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 2.w, bottom: 1.h),
          child: Row(
            children: [
              Image.asset(
                "assets/shop/logo.png",
                width: 7.w,
                height: 3.h,
              ),
              SizedBox(width: 1.4.w),
              Text(
                'تشطيبة',
                style: TextStyle(
                  color: const Color(0xFFECECEC),
                  fontSize: 14.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                ),
              ),
              SizedBox(width: 5.w),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Expanded(
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7E7E7),
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 1.3.h,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' إبحث عن تشطيبة',
                          hintStyle: TextStyle(
                            color: const Color(0xFF676767),
                            fontSize: 13.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon:
                              const Icon(IconsaxPlusLinear.search_normal),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 3.h),
          CustomTashteba(image: tashtebaPagesImages[currentPageIndex * 2]),
          SizedBox(height: 3.h),
          if (currentPageIndex * 2 + 1 < tashtebaPagesImages.length)
            CustomTashteba(
                image: tashtebaPagesImages[currentPageIndex * 2 + 1]),
          SizedBox(height: 3.h),
          const Divider(indent: 30, endIndent: 30),
          SizedBox(height: 2.h),
          Row(
            children: [
              const SizedBox(width: 110),
              GestureDetector(
                onTap: _goToPreviousPage,
                child: Arrow(
                  color: leftArrowColor,
                  icon: const Icon(IconsaxPlusLinear.arrow_left),
                ),
              ),
              const SizedBox(width: 12),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '0${currentPageIndex + 1}',
                      style: TextStyle(
                        color: const Color(0xFFA5A5A5),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                    TextSpan(
                      text: ' of ',
                      style: TextStyle(
                        color: const Color(0xFF999999),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                    TextSpan(
                      text: '0${(tashtebaPagesImages.length / 2).ceil()}',
                      style: TextStyle(
                        color: const Color(0xFF646262),
                        fontSize: 15.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.w),
              GestureDetector(
                onTap: _goToNextPage,
                child: Arrow(
                  color: rightArrowColor,
                  icon: const Icon(IconsaxPlusLinear.arrow_right),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
