import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';

class CustomAppBar extends StatefulWidget {
  final Function onCameraTap;
  final Function(String) onImageTap;

  const CustomAppBar({
    Key? key,
    required this.onCameraTap,
    required this.onImageTap,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedLabel = 'الكل'; // Default selected label
  Color selectedColor = const Color(0xff207768); // Selected color

  @override
  Widget build(BuildContext context) {
    // Fetching the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive dimensions
    final appBarHeight = screenHeight * 0.35; // 35% of the screen height
    final iconSize = screenWidth * 0.12; // 12% of the screen width
    final textSize = screenWidth * 0.04; // 4% of the screen width

    return Container(
      width: screenWidth,
      height: appBarHeight * 0.8, // Decreased height by 20%
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: appBarHeight * 0.15), // 15% of appBarHeight
          Text(
            'السوق',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: textSize,
              fontFamily: 'noto',
              fontWeight: FontWeight.w900,
              height: 0,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartView()),
                  );
                },
                child: Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF20776B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    IconsaxPlusLinear.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () => widget.onCameraTap(),
                child: Container(
                  width: screenWidth * 0.78, // 78% of screen width
                  height: iconSize,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconsaxPlusLinear.search_normal_1,
                        color: const Color(0xFF373737),
                        size: textSize * 0.9, // Responsive icon size
                      ),
                      const Spacer(), // Space between icons and text
                      Text(
                        'ابحث ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF373737),
                          fontSize: textSize,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 9),
                      Icon(
                        IconsaxPlusLinear.camera,
                        color: const Color(0xFF373737),
                        size: textSize * 0.98, // Responsive icon size
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageWithText("assets/shop/Group 34208.png", "ميكب"),
              _buildImageWithText("assets/shop/tv.png", 'دش'),
              _buildImageWithText("assets/shop/Hammer.png", 'نجارة'),
              _buildImageWithText("assets/shop/Water Tap.png", 'سباكة'),
              _buildImageWithText("assets/shop/Electricity (1).png", 'كهرباء'),
              _buildImageWithText("assets/shop/Group.png", 'الكل'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithText(String assetPath, String label) {
    final isSelected = selectedLabel == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLabel = label; // Update the selected label
        });
        widget.onImageTap(label); // Call the onImageTap function
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? selectedColor : const Color(0xFFACA9A7),
                  fontSize: 16,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              if (isSelected)
                Container(
                  height: 2,
                  width: 30,
                  color: selectedColor,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
