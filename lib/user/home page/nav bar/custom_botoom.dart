import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/home%20page/custom_ADs.dart';
import 'package:sahelnahaa/user/home%20page/custom_cards.dart';
import 'package:sahelnahaa/user/home%20page/custom_review.dart';
import 'package:sahelnahaa/user/home%20page/custom_tashteb.dart';
import 'package:sahelnahaa/user/home%20page/custom_text.dart';

import 'package:sahelnahaa/user/home%20page/nav%20bar/clipper.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/constant.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/nav_btn.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/size_config.dart';

class CustomBotoom extends StatefulWidget {
  const CustomBotoom({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CustomBotoom> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        shadowColor: const Color(0x3F000000),
        leading: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              width: 32,
              height: 32,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFD8CCCC)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Icon(IconsaxPlusLinear.notification),
            ),
            const SizedBox(width: 5),
            Container(
              width: 32,
              height: 32,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFD8CCCC)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Icon(IconsaxPlusLinear.shopping_cart),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 190),
                  child: Text(
                    'أهلا, محمد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8999999761581421),
                      fontSize: 15,
                      fontFamily: 'noto',
                      height: 0.09,
                      letterSpacing: -0.39,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 140),
                      child: Text(
                        'شارع احمد كامل الدقهليه',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFCDCDD3),
                          fontSize: 11,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        leadingWidth: 600,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              child: Image.asset(
                "assets/images/profile.png",
                width: 42,
                height: 45,
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff207768),
              ),
              child: null,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            controller: pageController,
            children: const [
              // Replace with your actual pages
              Center(child: Text('Page 1')),
              Center(child: Text('Page 2')),
              Center(child: Text('Page 3')),
              Center(child: Text('Page 4')),
              Center(child: Text('Page 5')),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: bottomNav(),
          ),
        ],
      ),
    );
  }

  Widget bottomNav() {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.blockSizeHorizontal * 4.5, 0,
          AppSizes.blockSizeHorizontal * 4.5, 20),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
          height: AppSizes.blockSizeHorizontal * 18,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: AppSizes.blockSizeHorizontal * 3,
                right: AppSizes.blockSizeHorizontal * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: IconsaxPlusLinear.home,
                      currentIndex: _currentIndex,
                      index: 0,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: IconsaxPlusLinear.alarm,
                      currentIndex: _currentIndex,
                      index: 1,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: IconsaxPlusLinear.category,
                      currentIndex: _currentIndex,
                      index: 2,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: IconsaxPlusLinear.setting,
                      currentIndex: _currentIndex,
                      index: 3,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        animateToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                      icon: IconsaxPlusLinear.profile,
                      currentIndex: _currentIndex,
                      index: 4,
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                top: 0,
                left: animatedPositionedLEftValue(_currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.blockSizeHorizontal * 1.0,
                      width: AppSizes.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradient,
                          ),
                        ),
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
