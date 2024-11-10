import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/chatbot/chat_screen.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
import 'package:sahelnahaa/user/order/Qr_code.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';

class Orderview extends StatefulWidget {
  const Orderview({super.key});

  @override
  State<Orderview> createState() => _OrderviewState();
}

class _OrderviewState extends State<Orderview> {
  int _selectedIndex = 0; // Default selected index for home icon
  String selectedOrder = 'الطلبات الجارية';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 430,
            height: 255,
            decoration: ShapeDecoration(
              color: const Color(0xFF20776B),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 45),
                Row(
                  children: [
                    const SizedBox(width: 363),
                    Image.asset(
                      "assets/shop/logo.png",
                      width: 28,
                      height: 23,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        SizedBox(
                          width: 131,
                          child: Text(
                            'الأموال المدفوعة في الخدمة',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45, top: 4),
                          child: Container(
                            width: 87,
                            height: 30,
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF1E5850),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '800 جنية',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w400,
                                    height: 0.12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 90),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const QrCode();
                        }));
                      },
                      child: Container(
                        width: 132,
                        height: 43,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1E5850),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              ' حضور الفني',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset("assets/shop/Group 39884.png"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 9),
                Opacity(
                  opacity: 0.10,
                  child: Container(
                    width: 390,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFFFCFCFC),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 4, left: 150),
                  child: const Text(
                    'الطلب القادم عند الاربعاء 23 أغسطس',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4, left: 270),
                      child: const Text(
                        'يوم على الحضور',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 19,
                      height: 23,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF1E5850),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildOrderContainer('الطلبات المؤكدة'),
                      _buildOrderContainer('الطلبات الملغاة'),
                      _buildOrderContainer('الطلبات الجارية'),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        backgroundColor: const Color(0xff207768),
        elevation: 10,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            const SizedBox(width: 50),
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
            const SizedBox(width: 50),
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

  Widget _buildOrderContainer(String title) {
    bool isSelected = title == selectedOrder;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOrder = title;
        });
      },
      child: Container(
        width: 120,
        height: 45,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFFCAAC36) : const Color(0xFFE8E8E8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF7C7C7C),
            fontSize: 14,
            fontFamily: 'noto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
