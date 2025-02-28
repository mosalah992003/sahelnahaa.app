import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';
import 'package:sahelnahaa/user/chatbot/chat_screen.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/market/custom_card.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:sahelnahaa/user/profile/favourite.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  int _selectedIndex = 2;
  final ImagePicker _picker = ImagePicker();
  // ignore: unused_field, prefer_final_fields
  Color _selectedColor = Colors.transparent;
  // ignore: unused_field, prefer_final_fields
  int _currentIndex = 1;
  final PageController pageController = PageController();
  // ignore: prefer_final_fields
  List<XFile> _images = [];

  // List of image paths and corresponding text
  final List<Map<String, String>> _imageTextList = [
    {'image': "assets/shop/quiz_2789063.png", 'text': 'دش'},
    {'image': "assets/shop/saw_1286587.png", 'text': 'نجارة'},
    {'image': "assets/shop/faucet_8948942.png", 'text': 'سباكة'},
    {'image': "assets/shop/charger_15220291.png", 'text': 'كهرباء'},
    {'image': "assets/shop/market-share_15178254.png", 'text': 'الكل'},
  ];

  // Track the selected item index
  int _selectedItemIndex = 4; // Default to 'الكل'

  void _onImageTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  void _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const Orderview();
        }));
        break;
      case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const RepairView();
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

    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(15.h), // Adjust height as needed
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AppBar(
                toolbarHeight: 8.h,
                backgroundColor: const Color(0xff207768),
                automaticallyImplyLeading: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4.h),
                    bottomRight: Radius.circular(4.h),
                  ),
                ),
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CartView();
                        }));
                      },
                      child: Container(
                        width: 9.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        child: Icon(
                          IconsaxPlusLinear.shopping_cart,
                          color: Colors.black,
                          size: 2.5.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const FavouritePage();
                        }));
                      },
                      child: Container(
                        width: 9.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        child: Icon(
                          IconsaxPlusLinear.heart_add,
                          color: Colors.black,
                          size: 2.5.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 19.w),
                    Text(
                      'السوق',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w600,
                        height: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -2.5.h, // Adjust position to overlap outside AppBar
                left: 5.w,
                right: 5.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: IconButton(
                          icon: Icon(
                            IconsaxPlusLinear.camera,
                            color: const Color(0xFF373737),
                            size: 2.h,
                          ),
                          onPressed: _openCamera,
                        ),
                        suffixIcon: Icon(
                          IconsaxPlusLinear.search_normal_1,
                          color: const Color(0xFF373737),
                          size: 2.h,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 3.5.w), // Decrease vertical padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'ابحث ',
                        hintStyle: TextStyle(
                          color: const Color(0xFF373737),
                          fontSize: 15.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          height:
                              1.2, // Adjust line height for better alignment
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
      backgroundColor: const Color(0xFFf9f9f9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _imageTextList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var item = entry.value;
                  bool isSelected = _selectedItemIndex == index;

                  return GestureDetector(
                    onTap: () => _onImageTap(index),
                    child: Column(
                      children: [
                        Container(
                          width: 14.w,
                          height: 14.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF207768)
                                : Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.w),
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          item['text']!,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? const Color(0xFF207768)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.3.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 1.5.h,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomCard(
                    productName: 'مكواة',
                    productDescription: 'مكواة ملابس بها منظم حرارة ',
                    productPrice: '350',
                    imagePath: 'assets/shop/image 3.png',
                  );
                },
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            if (_images.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Image.file(
                        File(_images[index].path),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
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
}
