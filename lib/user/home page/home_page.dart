import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';
import 'package:sahelnahaa/user/chatbot/chat_screen.dart';
import 'package:sahelnahaa/user/home%20page/custom_ADs.dart';
import 'package:sahelnahaa/user/home%20page/custom_cards.dart';
import 'package:sahelnahaa/user/home%20page/custom_drawer.dart';
import 'package:sahelnahaa/user/home%20page/custom_review.dart';
import 'package:sahelnahaa/user/home%20page/custom_tashteb.dart';
import 'package:sahelnahaa/user/home%20page/custom_text.dart';
import 'package:sahelnahaa/user/notification/notification.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:sahelnahaa/user/market/market_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController();
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Orderview();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const RepairView();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MarketView();
        }));
        break;
      case 3:
        if (_selectedIndex != 3) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));
        }
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final isLandscape = size.width > size.height;

    double appBarHeight = height * 0.1;
    double iconSize = width * 0.08;
    double textSize = isLandscape ? 12 : 15;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
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
                  return const NotificationPage();
                }));
              },
              child: Container(
                width: iconSize,
                height: iconSize,
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
                  return const CartView();
                }));
              },
              child: Container(
                width: iconSize,
                height: iconSize,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.03, left: width * .43),
                  child: Text(
                    'أهلا, محمد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: textSize,
                      fontFamily: 'noto',
                      height: 1.2,
                      letterSpacing: -0.39,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.3),
                  child: const Text(
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
        leadingWidth: width * 0.85,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: InkWell(
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              child: Image.asset(
                "assets/images/profile.png",
                width: iconSize * 1.5,
                height: iconSize * 1.5,
              ),
            ),
          ),
        ],
      ),
      endDrawer: const CustomDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 16,
          ),
          CustomText(
            name: 'عرض الكل',
            namee: 'العروض ',
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 8, right: width * 0.05, left: width * 0.05),
            child: const PromoCard(),
          ),
          SizedBox(height: height * 0.035),
          const CustomText(name: 'عرض الكل', namee: 'الخدمات'),
          const CustomGridView(),
          const CustomText(name: 'عرض الكل', namee: 'تشطيبة'),
          const SingleChildScrollView(
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
                  tittle: 'دهان ونقاشة كاملة و السعر للغرفة ',
                ),
                CustomTashteb(
                  photo: "assets/cards/44.png",
                  price: "3200",
                  tittle: 'تركيب سيراميك كامل السعر للغرفة ',
                ),
                CustomTashteb(
                  photo: "assets/cards/55 1.png",
                  price: "3200",
                  tittle: 'تركيب كهرباء كاملة السعر للغرفه  ',
                ),
              ],
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
        child: Image.asset(
          "assets/shop/Robot.png",
          width: 26,
          height: 26,
        ),
        backgroundColor: Color(0xff207768),
        elevation: 10,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        height: 72,
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
            SizedBox(width: 50),
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
            SizedBox(width: 50),
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
            color:
                _selectedIndex == index ? Color(0xff207768) : Color(0xffA3A3A3),
            size: 27,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? Color(0xff207768)
                  : Color(0xffA3A3A3),
              fontSize: 11,
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
