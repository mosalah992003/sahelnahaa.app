import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';
import 'package:sahelnahaa/user/home%20page/custom_ADs.dart';
import 'package:sahelnahaa/user/home%20page/custom_cards.dart';
import 'package:sahelnahaa/user/home%20page/custom_drawer.dart';
import 'package:sahelnahaa/user/home%20page/custom_review.dart';
import 'package:sahelnahaa/user/home%20page/custom_tashteb.dart';
import 'package:sahelnahaa/user/home%20page/custom_text.dart';
import 'package:sahelnahaa/user/inbox/chatbot.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
import 'package:sahelnahaa/user/notification/notification2.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // ignore: use_super_parameters
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController();
  String userName = 'محمد'; // Default name
  String userAddress = 'شارع احمد كامل الدقهليه'; // Default address
  String? _profileImagePath; // To store the selected image path
  int _selectedIndex = 3; // Default to Home page

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Orderview(),
        ),
      ).then((_) {
        setState(() {
          _selectedIndex = 3;
        });
      });
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RepairView(),
        ),
      ).then((_) {
        setState(() {
          _selectedIndex = 3;
        });
      });
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MarketView(),
        ),
      ).then((_) {
        setState(() {
          _selectedIndex = 3;
        });
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'محمد';
      userAddress = prefs.getString('address') ?? 'شارع احمد كامل الدقهليه';
      _profileImagePath =
          prefs.getString('profile_image'); // Load saved image path
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        toolbarHeight: 10.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5.h),
          ),
        ),
        shadowColor: const Color(0x3F000000),
        leading: Row(
          children: [
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Notification2();
                }));
              },
              child: Container(
                width: 8.w,
                height: 3.8.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: .1.w, color: const Color(0xFFD8CCCC)),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                ),
                child: Icon(
                  IconsaxPlusLinear.notification,
                  size: 2.8.h,
                ),
              ),
            ),
            SizedBox(width: 1.5.w),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartView();
                }));
              },
              child: Container(
                width: 8.w,
                height: 3.8.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: .1.h, color: const Color(0xFFD8CCCC)),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                ),
                child: Icon(
                  IconsaxPlusLinear.shopping_cart,
                  size: 2.8.h,
                ),
              ),
            ),
          ],
        ),
        leadingWidth: double.infinity,
        actions: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.7.h, right: 1.4.w),
                    child: Text(
                      'أهلا, $userName',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15.8.sp,
                        fontFamily: 'noto',
                        height: 1.2,
                        letterSpacing: -0.39,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.only(right: 1.4.w),
                    child: Text(
                      userAddress,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFFCDCDD3),
                        fontSize: 13.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: CircleAvatar(
                    radius: 3.h,
                    backgroundImage: _profileImagePath != null
                        ? FileImage(File(_profileImagePath!)) as ImageProvider
                        : const AssetImage("assets/images/profile.png"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      endDrawer: const CustomDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 2.3.h,
          ),
          const CustomText(
            name: 'عرض الكل',
            namee: 'العروض ',
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.3.h, right: 5.w, left: 5.w),
            child: const PromoCard(),
          ),
          SizedBox(height: 2.h),
          const CustomText(name: 'عرض الكل', namee: 'الخدمات'),
          const CustomGridView(),
          const CustomText(name: 'عرض الكل', namee: 'تشطيبة'),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTashteb(
                    photo: 'assets/cards/Group 48095502.png',
                    price: '4200',
                    tittle: 'تركيب جميع أدوات السباكة ',
                  ),
                  CustomTashteb(
                    photo: 'assets/cards/Group 48095501.png',
                    price: '2400',
                    tittle: 'تركيب ستائر وديكور 4 غرف ',
                  ),
                  CustomTashteb(
                    photo: 'assets/cards/Group 48095500.png',
                    price: "1500",
                    tittle: 'دهان ونقاشة كاملة و السعر للغرفة ',
                  ),
                  CustomTashteb(
                    photo: 'assets/cards/Group 48095503.png',
                    price: "3200",
                    tittle: 'تركيب سيراميك كامل السعر للغرفة ',
                  ),
                  CustomTashteb(
                    photo: 'assets/cards/Group 48095504.png',
                    price: "3200",
                    tittle: 'تركيب كهرباء كاملة السعر للغرفه  ',
                  ),
                ],
              ),
            ),
          ),
          const CustomReview(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChatScreen();
          }));
        },
        // ignore: sort_child_properties_last
        child: Image.asset(
          "assets/shop/Robot.png",
          width: 10.w,
          height: 3.5.h,
        ),
        backgroundColor: const Color(0xff207768),
        elevation: 10,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 6.3.w),
        height: 7.9.h,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildBottomNavItem(
              icon: _selectedIndex == 0
                  ? IconsaxPlusBold.receipt_edit
                  : IconsaxPlusLinear.receipt_edit,
              label: 'طلباتي',
              index: 0,
            ),
            SizedBox(width: 13.w),
            _buildBottomNavItem(
              icon: _selectedIndex == 1
                  ? FontAwesomeIcons.wrench
                  : LineAwesomeIcons.wrench_solid,
              label: 'الخدمات',
              index: 1,
            ),
            const Spacer(),
            _buildBottomNavItem(
              icon: _selectedIndex == 2
                  ? IconsaxPlusBold.shop
                  : IconsaxPlusLinear.shop,
              label: 'السوق',
              index: 2,
            ),
            SizedBox(width: 13.w),
            _buildBottomNavItem(
              icon: _selectedIndex == 3
                  ? IconsaxPlusBold.home_1
                  : IconsaxPlusLinear.home_1,
              label: 'الرئيسية',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? const Color(0xff207768)
                : const Color(0xffA3A3A3),
            size: 3.h,
          ),
          SizedBox(height: .5.h),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? const Color(0xff207768)
                  : const Color(0xffA3A3A3),
              fontSize: 13.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
    );
  }
}
