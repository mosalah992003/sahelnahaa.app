import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/chatbot/chat_screen.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/home%20page/nav%20bar/size_config.dart';
import 'package:sahelnahaa/user/market/custom_card.dart';
import 'package:sahelnahaa/user/market/icon.dart';
import 'package:sahelnahaa/user/order/orderview.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  int _selectedIndex = 2; // Default selected index for home icon

  final ImagePicker _picker = ImagePicker();
  Color _selectedColor = Colors.transparent;
  int _currentIndex = 1; // Set initial index to 1 for the Market page
  final PageController pageController = PageController();

  void _onImageTap(String label) {
    setState(() {
      _selectedColor = const Color(0xFF20776B);
    });
  }

  void _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print('Image path: ${image.path}');
    }
  }

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
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const RepairView();
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
      _selectedIndex = 2; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize AppSizes once context is available
    AppSizes.init(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: ListView(
        children: [
          // Ensure CustomAppBar is not null and handles parameters correctly
          CustomAppBar(
            onCameraTap: _openCamera,
            onImageTap: _onImageTap,
          ),
          // GridView with padding from right and left
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 30),
            child: GridView.builder(
              shrinkWrap:
                  true, // To allow the GridView to take up only the necessary space
              physics:
                  NeverScrollableScrollPhysics(), // Disable scrolling of GridView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of cards per row
                childAspectRatio:
                    0.65, // Aspect ratio to control height of cards
                crossAxisSpacing: 10, // Space between columns
                mainAxisSpacing: 10, // Space between rows
              ),
              itemCount:
                  10, // Number of cards (you can change this to your list length)
              itemBuilder: (context, index) {
                return CustomCard(); // Place your custom card widget here
              },
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
