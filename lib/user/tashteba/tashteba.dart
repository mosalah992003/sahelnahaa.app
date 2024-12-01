import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/tashteba/arrow.dart';
import 'package:sahelnahaa/user/tashteba/custom_tashteba.dart';

// List of images to cycle through
final List<String> tashtebaPagesImages = [
  'assets/shop/card.png',
  'assets/shop/Card (1).png',
  "assets/shop/card (2).png",
  'assets/shop/Card (3).png',
  'assets/cards/card (4).png',
  'assets/shop/card (5).png',
];

class Tashteba extends StatefulWidget {
  const Tashteba({super.key});

  @override
  _TashtebaState createState() => _TashtebaState();
}

class _TashtebaState extends State<Tashteba> {
  int currentPageIndex = 0;

  void _goToNextPage() {
    setState(() {
      if (currentPageIndex < (tashtebaPagesImages.length / 2).floor()) {
        currentPageIndex++;
      }
    });
  }

  void _goToPreviousPage() {
    setState(() {
      if (currentPageIndex > 0) {
        currentPageIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the colors for the arrows based on the current page
    Color leftArrowColor = Colors.white;
    Color rightArrowColor = const Color(0xff207768);

    if (currentPageIndex == 1) {
      // Both arrows are green on page 2
      leftArrowColor = const Color(0xff207768);
      rightArrowColor = const Color(0xff207768);
    } else if (currentPageIndex == 2) {
      // Left arrow is green, right arrow is white on page 3
      leftArrowColor = const Color(0xff207768);
      rightArrowColor = Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 15),
          child: Row(
            children: [
              Image.asset(
                "assets/shop/logo.png",
                width: 28,
                height: 24,
              ),
              const SizedBox(width: 5),
              const Text(
                'تشطيبة',
                style: TextStyle(
                  color: Color(0xFFECECEC),
                  fontSize: 14,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7E7E7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            '                           ...إبحث عن تشطيبة',
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 12,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: Icon(IconsaxPlusLinear.search_normal),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 28),
          CustomTashteba(image: tashtebaPagesImages[currentPageIndex * 2]),
          const SizedBox(height: 24),
          if (currentPageIndex * 2 + 1 < tashtebaPagesImages.length)
            CustomTashteba(
                image: tashtebaPagesImages[currentPageIndex * 2 + 1]),
          const SizedBox(height: 24),
          const Divider(indent: 30, endIndent: 30),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 110),
              GestureDetector(
                onTap: _goToPreviousPage,
                child: Arrow(
                  color: leftArrowColor,
                  icon: const Icon(IconsaxPlusLinear.arrow_left),
                ),
              ),
              const SizedBox(width: 12),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '0${currentPageIndex + 1}',
                      style: const TextStyle(
                        color: Color(0xFFA5A5A5),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                    const TextSpan(
                      text: ' of ',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                    TextSpan(
                      text: '0${(tashtebaPagesImages.length / 2).ceil()}',
                      style: const TextStyle(
                        color: Color(0xFF646262),
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: _goToNextPage,
                child: Arrow(
                  color: rightArrowColor,
                  icon: const Icon(IconsaxPlusLinear.arrow_right),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
