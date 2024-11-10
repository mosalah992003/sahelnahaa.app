import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/market/details.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen

    return Container(
      width: 187,
      height: 291, // Increased height
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.58),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 16,
            offset: Offset(0, 2.26),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Discount badge at the top left
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              width: 63,
              height: 20,
              decoration: ShapeDecoration(
                color: const Color(0xFF881A1A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Center(
                child: Text(
                  'خصم 20%',
                  style: TextStyle(
                    color: Color(0xFFD7C9C9),
                    fontSize: 10,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // Heart icon at the top right
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 28,
              height: 28,
              padding: const EdgeInsets.all(6.29),
              decoration: ShapeDecoration(
                color: const Color(0xFFCDD0CF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(54),
                ),
              ),
              child: const Icon(
                IconsaxPlusLinear.heart,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
          // Product image in the center
          Positioned(
            top: 45,
            left: 26,
            right: 26,
            child: Container(
              height: 150,
              width: 155, // Decreased height by 20%
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/shop/image 4.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Product description and price at the bottom left
          const Positioned(
            bottom: 50,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السعر الحالى',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 8,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '520 جنية',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 11,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // Product name and details at the bottom right
          const Positioned(
            bottom: 50,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'مروحة 3 ريشة',
                  style: TextStyle(
                    color: Color(0xFF20776B),
                    fontSize: 12,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'مروحه بها منظم سرعات ',
                  style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 7,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 7,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(); // Assuming DetailsPage is the widget for the details page
                  }));
                },
                child: Container(
                  width: 123,
                  height: 32,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF20776B), Color(0xFF3B7F76)],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Icon(
                          IconsaxPlusLinear.shopping_cart,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 6),
                      VerticalDivider(
                        width: 1,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'إضافة إلى السلة',
                        style: TextStyle(
                          color: Color(0xFFFAF9F9),
                          fontSize: 9,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
