import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';
import 'package:sahelnahaa/user/home%20page/custom_ADs.dart';
import 'package:sahelnahaa/user/home%20page/custom_cards.dart';
import 'package:sahelnahaa/user/home%20page/custom_drawer.dart';
import 'package:sahelnahaa/user/home%20page/custom_review.dart';
import 'package:sahelnahaa/user/home%20page/custom_tashteb.dart';
import 'package:sahelnahaa/user/home%20page/custom_text.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/clipper.dart'; // Ensure this path is correct
import 'package:sahelnahaa/user/home%20page/nav%20bar/constant.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/nav_btn.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/size_config.dart';
import 'package:sahelnahaa/user/notification/notification.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initialize AppSizes
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
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationPage();
                }));
              },
              child: Container(
                width: 32,
                height: 32,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFD8CCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(IconsaxPlusLinear.notification),
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartView();
                }));
              },
              child: Container(
                width: 32,
                height: 32,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFD8CCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(IconsaxPlusLinear.shopping_cart),
              ),
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
      endDrawer: CustomDrawer(),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            controller: pageController,
            children: [
              ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: PromoCard(),
                  ),
                  SizedBox(height: 28),
                  CustomText(
                    name: 'عرض الكل',
                    namee: 'الخدمات',
                  ),
                  CustomGridView(),
                  CustomText(name: 'عرض الكل', namee: 'تشطيبة'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomTashteb(
                          photo: 'assets/cards/Select Inverse 1.png',
                          price: '4200',
                          tittle: 'تركيب جميع أدوات السباكة ',
                        ),
                        CustomTashteb(
                          photo: 'assets/cards/11 1.png',
                          price: '2400',
                          tittle: 'تركيب ستائر وديكور 4 غرف ',
                        ),
                        CustomTashteb(
                            photo: "assets/cards/22 1.png",
                            price: "1500",
                            tittle: 'دهان ونقاشة كاملة و السعر للغرفة '),
                        CustomTashteb(
                            photo: "assets/cards/44.png",
                            price: "3200",
                            tittle: 'تركيب سيراميك كامل السعر للغرفة '),
                        CustomTashteb(
                            photo: "assets/cards/55 1.png",
                            price: "3200",
                            tittle: 'تركيب كهرباء كاملة السعر للغرفه  ')
                      ],
                    ),
                  ),
                  CustomReview(),
                ],
              ),
              Center(child: Text('Page 2')),
              Center(child: Text('Page 3')),
              Center(child: Text('Page 5')),
            ],
          ),
          Positioned(
            bottom: 0, // Increase this value to move the navigation bar down
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
            color: Color(0xff207768),
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
                      icon: IconsaxPlusLinear.receipt_edit,
                      currentIndex: _currentIndex,
                      index: 4,
                    ),
                    BottomNavBTN(
                      onPressed: (val) {
                        if (val == 3) {
                          setState(() {
                            _currentIndex =
                                val; // Move the ClipPath to the repair icon
                          });

                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RepairView()),
                            ).then((_) {
                              // Reset the icon to the default (index 0) when returning
                              setState(() {
                                _currentIndex = 0;
                              });
                            });
                          });
                        } else {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        }
                      },
                      icon: LineAwesomeIcons.wrench_solid,
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
                      icon: LineAwesomeIcons.robot_solid,
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
                      icon: IconsaxPlusLinear.shop,
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
                      icon: IconsaxPlusLinear.home_2,
                      currentIndex: _currentIndex,
                      index: 0,
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
                      clipper:
                          MyCustomClipper(), // Use your custom clipper here
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 13,
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

  void animateToPage(int val) {
    pageController.animateToPage(val,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  double animatedPositionedLEftValue(int index) {
    switch (index) {
      case 4:
        return AppSizes.blockSizeHorizontal * 5;
      case 3:
        return AppSizes.blockSizeHorizontal * 22;
      case 2:
        return AppSizes.blockSizeHorizontal * 39;
      case 1:
        return AppSizes.blockSizeHorizontal * 56;
      case 0:
        return AppSizes.blockSizeHorizontal * 73;
      default:
        return AppSizes.blockSizeHorizontal * 5;
    }
  }
}
