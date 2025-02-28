import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/chatbot/chat_screen.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
import 'package:sahelnahaa/user/order/canceldorder.dart';
import 'package:sahelnahaa/user/order/confirmorder.dart';
import 'package:sahelnahaa/user/order/notrespons.dart';
import 'package:sahelnahaa/user/order/prices.dart';
import 'package:sahelnahaa/user/order/runorder.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Orderview extends StatefulWidget {
  const Orderview({super.key});

  @override
  State<Orderview> createState() => _OrderviewState();
}

class _OrderviewState extends State<Orderview> {
  int _selectedIndex = 0; // Default selected index for home icon
  String selectedOrder = 'الطلبات المعلقة';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  bool isScanning = false;
  bool showNotRespons = true; // Controls visibility of Notrespons
  bool showRunOrder = false; // Controls visibility of Runorder
  bool showCanceldOrder = false; // Controls visibility of Canceldorder
  bool showConfirmOrder = false; // Controls visibility of Confirmorder

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
      // ignore: unreachable_switch_case
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

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qrController = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        isScanning = false;
      });
      // Handle the scanned data
      // ignore: avoid_print
      print('Scanned Data: ${scanData.code}');
      // You can add your logic here to handle the scanned data
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        toolbarHeight: 20.h, // Adjust height as needed
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.h),
            bottomRight: Radius.circular(5.h),
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Distribute space evenly
              children: [
                // First Container
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Prices();
                    }));
                  },
                  child: Container(
                    width: 20.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/shop/Group 48095476.png', // Replace with your image path
                          width: 14.w,
                          height: 3.h,
                        ),
                        const SizedBox(
                            height: 5), // Spacing between image and text
                        Text(
                          'المدفوعات',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff207768),
                            fontFamily: "noto",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Second Container
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RepairView();
                    }));
                  },
                  child: Container(
                    width: 20.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/shop/Car.png', // Replace with your image path
                          width: 14.w,
                          height: 3.5.h,
                        ),
                        const SizedBox(
                            height: 5), // Spacing between image and text
                        Text(
                          'الخدمات',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff207768),
                            fontFamily: "noto",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Third Container
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isScanning = true;
                    });
                  },
                  child: Container(
                    width: 20.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/shop/Qr Wallet.png', // Replace with your image path
                          width: 14.w,
                          height: 3.5.h,
                        ),
                        const SizedBox(
                            height: 5), // Spacing between image and text
                        Text(
                          'حضور الفني',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "noto",
                            color: const Color(0xff207768),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Opacity(
              opacity: 0.10,
              child: Container(
                width: 85.w,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFFCFCFC),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'يوم على الحضور 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        IconsaxPlusBold.calendar,
                        color: Colors.white,
                        size: 2.5.h,
                      )
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'الطلب القادم عند',
                          style: TextStyle(
                            color: const Color(0xFFEDE8E8),
                            fontSize: 12.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' الأربعاء',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' 23 أغسطس',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ListView(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 5.h,
                  child: ListView(
                    reverse: true,
                    scrollDirection:
                        Axis.horizontal, // Enables horizontal scrolling
                    children: [
                      _buildOrderContainer(
                        'الطلبات المعلقة',
                        const Color(0xFFC3AE5F),
                      ),
                      SizedBox(width: 2.5.w),
                      _buildOrderContainer(
                        'الطلبات الجارية',
                        const Color(0xFF3369B9),
                      ),
                      SizedBox(width: 2.5.w),
                      _buildOrderContainer(
                        'الطلبات المؤكدة',
                        const Color(0xFF047857),
                      ),
                      SizedBox(width: 2.5.w),
                      _buildOrderContainer(
                          'الطلبات الملغاة', const Color(0xFF8D2828)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                if (selectedOrder == 'الطلبات المعلقة' && showNotRespons)
                  Notrespons(
                    onReject: () {
                      setState(() {
                        showNotRespons = false;
                      });
                    },
                    onAccept: () {
                      setState(() {
                        showNotRespons = false;
                        showRunOrder = true;
                      });
                    },
                  ),
                if (selectedOrder == 'الطلبات الجارية' && showRunOrder)
                  Runorder(
                    onCancel: () {
                      setState(() {
                        showRunOrder = false;
                        showCanceldOrder = true;
                      });
                    },
                    onConfirm: () {
                      setState(() {
                        showRunOrder = false;
                        showConfirmOrder = true;
                      });
                    },
                  ),
                if (selectedOrder == 'الطلبات الملغاة' && showCanceldOrder)
                  const Canceldorder(),
                if (selectedOrder == 'الطلبات المؤكدة' && showConfirmOrder)
                  const Confirmorder(),
                // Display a placeholder if no orders are available
                if (!showNotRespons &&
                    !showRunOrder &&
                    !showCanceldOrder &&
                    !showConfirmOrder)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/shop/In no time-cuate.png', // Replace with your image path
                          width: 50.w,
                          height: 50.w,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'لا توجد طلبات متاحة',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey,
                            fontFamily: 'noto',
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (isScanning)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                          borderColor: const Color(0xff207768),
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: 300,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isScanning = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff207768),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 1.5.h),
                      ),
                      child: Text(
                        'إغلاق الماسح',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontFamily: 'noto',
                        ),
                      ),
                    ),
                  ],
                ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 28),
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
          const SizedBox(height: 4),
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

  Widget _buildOrderContainer(String title, Color selectedColor) {
    bool isSelected = title == selectedOrder;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOrder = title;
        });
      },
      child: Container(
        width: 31.w,
        height: 5.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: isSelected ? selectedColor : const Color(0xFFE8E8E8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.2.h),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF7C7C7C),
            fontSize: 14.sp,
            fontFamily: 'noto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
