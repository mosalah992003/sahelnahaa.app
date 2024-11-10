import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomReview extends StatefulWidget {
  const CustomReview({super.key});

  @override
  State<CustomReview> createState() => _CustomReviewState();
}

class _CustomReviewState extends State<CustomReview> {
  @override
  Widget build(BuildContext context) {
    // Set the active dot index; this can be controlled by a state management solution.
    int _currentIndex = 9;

    // Get the screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    // Define a base width for responsive design
    const double baseWidth = 390.0;

    // Calculate scale factors based on screen size
    final widthFactor = screenWidth / baseWidth;

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20 * widthFactor, vertical: 10),
          child: Container(
            width: baseWidth * widthFactor,
            decoration: ShapeDecoration(
              color: const Color(0xFFE1E1E1),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.circular(24 * widthFactor),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'أراء العملاء في الخدمة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16 * widthFactor,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'شاركنا رأيك',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 10 * widthFactor,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ' أود شكر كل القائمين على الفكرة و العمل لأنجاح هذا',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 10 * widthFactor,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' المشروع كان ناجحاً بفضل جهودهم',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 10 * widthFactor,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 56 * widthFactor,
                      height: 56 * widthFactor,
                      padding: EdgeInsets.all(8 * widthFactor),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF8F8F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29 * widthFactor),
                        ),
                      ),
                      child: Container(
                        width: 40 * widthFactor,
                        height: 40 * widthFactor,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/cards/image 37.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20 * widthFactor, right: 4 * widthFactor),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'omar ghaly',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 10 * widthFactor,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, right: 280 * widthFactor),
                  child: Container(
                    width: 30 * widthFactor,
                    height: 30 * widthFactor,
                    decoration: ShapeDecoration(
                      color: const Color(0xff207768),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29 * widthFactor),
                      ),
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Dot indicator row
        DotsIndicator(
          dotsCount: 10,
          position: _currentIndex,
          onTap: (position) {
            setState(() => _currentIndex = position);
          },
          decorator: DotsDecorator(
            size: const Size.square(7.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: const Color(0xff207768),
            color: Colors.grey,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
