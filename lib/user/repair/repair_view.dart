import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/chatbot/chat_screen.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
import 'package:sahelnahaa/user/order/orderview.dart';

import 'package:sahelnahaa/user/repair/custom_repair.dart';

import 'package:sahelnahaa/user/home%20page/nav%20bar/size_config.dart';

class RepairView extends StatefulWidget {
  const RepairView({Key? key}) : super(key: key);

  @override
  _RepairViewState createState() => _RepairViewState();
}

class _RepairViewState extends State<RepairView> {
  int _selectedIndex = 1; // Default selected index for home icon

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Orderview();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MarketView();
        }));
        break;
      case 3:
        // Prevent pushing the HomePage again if already on it
        if (_selectedIndex != 3) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage(); // Navigate back to HomePage
          }));
        }
        break;
    }

    setState(() {
      _selectedIndex = 1; // Update selected index
    });
  }

  Widget build(BuildContext context) {
    // Initialize AppSizes
    AppSizes.init(context);

    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF9F9F9),
        title: const Center(
          child: Text(
            'خدماتي',
            style: TextStyle(
              color: Color(0xFF1B2431),
              fontSize: 22,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: CustomRepair(),
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
