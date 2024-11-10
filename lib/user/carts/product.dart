import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting the screen size
    final screenSize = MediaQuery.of(context).size;

    // Setting up responsive dimensions
    final containerWidth = screenSize.width * 0.9; // 90% of screen width
    final containerHeight =
        137.5 * (containerWidth / 390); // Maintain aspect ratio
    final imageWidth = 134 * (containerWidth / 390);
    final imageHeight = 115 * (containerWidth / 390);
    final textSizeSmall = 8 * (containerWidth / 390);
    final priceTextSize = 20 * (containerWidth / 390);
    final titleTextSize = 16 * (containerWidth / 390);
    final subtitleTextSize = 12 * (containerWidth / 390);
    final ratingSize = 14 * (containerWidth / 390);

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 251 * (containerWidth / 390),
            top: 9 * (containerHeight / 137.5),
            child: Container(
              width: imageWidth,
              height: imageHeight,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/shop/image 4.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.58),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16 * (containerWidth / 390),
            top: 65 * (containerHeight / 137.5),
            child: Text(
              'مجانا',
              style: TextStyle(
                color: Colors.black,
                fontSize: textSizeSmall,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 16 * (containerWidth / 390),
            top: 14 * (containerHeight / 137.5),
            child: const Icon(
              Icons.remove_shopping_cart_outlined,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Positioned(
            left: 40 * (containerWidth / 390),
            top: 62 * (containerHeight / 137.5),
            child: const Icon(
              IconsaxPlusBroken.truck_fast,
              size: 18,
              color: Colors.black87,
            ),
          ),
          Positioned(
            left: 16 * (containerWidth / 390),
            top: 87 * (containerHeight / 137.5),
            child: Text(
              '520 جنية',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: priceTextSize,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 70 * (containerWidth / 390),
            top: 17 * (containerHeight / 137.5),
            child: Container(
              width: 180 * (containerWidth / 390),
              height: 73 * (containerHeight / 137.5),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 180 * (containerWidth / 390),
                      height: 51 * (containerHeight / 137.5),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 28 * (containerHeight / 137.5),
                            child: SizedBox(
                              width: 180 * (containerWidth / 390),
                              height: 23,
                              child: Text(
                                'مروحه بها منظم سرعات ',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF848484),
                                  fontSize: subtitleTextSize,
                                  fontFamily: 'Noto Kufi Arabic',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 131 * (containerWidth / 390),
                            top: 0,
                            child: SizedBox(
                              width: 49,
                              height: 24,
                              child: Text(
                                'مروحة 3 ريشة',
                                style: TextStyle(
                                  color: Color(0xFF20776B),
                                  fontSize: titleTextSize,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 99 * (containerWidth / 390),
                    top: 59 * (containerHeight / 137.5),
                    child: Container(
                      width: 81,
                      height: 14,
                      child: Stack(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Positioned(
                              left: (i * 17.0) * (containerWidth / 390),
                              top: 0,
                              child: Container(
                                width: (i < 4) ? 14 : 15,
                                height: 14,
                                decoration: ShapeDecoration(
                                  color: (i < 4)
                                      ? const Color(0xFFFFDB22)
                                      : const Color(0x75ACA9A7),
                                  shape: const StarBorder(
                                    points: 5,
                                    innerRadiusRatio: 0.38,
                                    pointRounding: 0,
                                    valleyRounding: 0,
                                    rotation: 0,
                                    squash: 0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 189 * (containerWidth / 390),
            top: 94 * (containerHeight / 137.5),
            child: Container(
              width: 60,
              height: 37,
              padding: const EdgeInsets.only(right: 1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: 17, height: 17, child: const Stack()),
                        const SizedBox(width: 6),
                        Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF222121),
                            fontSize: 22 * (containerWidth / 390),
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(width: 17, height: 17, child: const Stack()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 230 * (containerWidth / 390),
            bottom: 10 * (containerHeight / 137.5),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: const Color(0xff207768))),
              child: const Icon(Icons.add, color: Colors.black, size: 14),
            ),
          ),
          Positioned(
            left: 180 * (containerWidth / 390),
            bottom: 10 * (containerHeight / 137.5),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: const Color(0xff207768))),
              child: const Icon(Icons.remove, color: Colors.black, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}
