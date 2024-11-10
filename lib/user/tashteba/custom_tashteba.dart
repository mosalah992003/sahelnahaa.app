import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomTashteba2 extends StatefulWidget {
  const CustomTashteba2({
    required this.day,
    required this.job,
    required this.photo_card,
    required this.price_job,
    required this.title_crad,
  });

  final String title_crad;
  final String job;
  final String day;
  final String price_job;
  final String photo_card;

  @override
  State<CustomTashteba2> createState() => _CustomTashteba2State();
}

class _CustomTashteba2State extends State<CustomTashteba2> {
  bool isHeartPressed = false;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define responsive dimensions
    double cardWidth = screenWidth * 0.9; // 90% of screen width
    double cardHeight = screenHeight * 0.2; // 25% of screen height
    double iconSize = cardHeight * 0.15; // Icon size relative to card height
    double fontSizeTitle = screenWidth * 0.04; // Title font size
    double fontSizeJob = screenWidth * 0.035; // Job font size
    double fontSizePrice = screenWidth * 0.035; // Price font size
    double paddingValue = screenWidth * 0.05; // Padding

    return Padding(
      padding: EdgeInsets.only(
          top: paddingValue * 0.5, // Decreased top padding by half
          right: paddingValue,
          left: paddingValue),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddingValue / 2, right: paddingValue),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isHeartPressed = !isHeartPressed;
                        });
                      },
                      child: Container(
                        width: iconSize,
                        height: iconSize,
                        decoration: BoxDecoration(
                          color: isHeartPressed
                              ? const Color(0xFF207768)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          IconsaxPlusLinear.heart,
                          size: iconSize *
                              0.8, // Icon size proportional to the heart button
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: paddingValue * 5),
                      child: Text(
                        widget.title_crad,
                        style: TextStyle(
                          color: const Color(0xFF1B2431),
                          fontSize: fontSizeTitle,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.47,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(endIndent: 18, indent: 18),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: paddingValue / 2),
                          child: Text(
                            widget.job,
                            style: TextStyle(
                              color: const Color(0xFF252525),
                              fontSize: fontSizeJob,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: paddingValue * 7.5, top: 3, bottom: 3),
                          child: Row(
                            children: [
                              const Icon(
                                IconsaxPlusLinear.rotate_right,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                widget.day,
                                style: TextStyle(
                                  color: const Color(0xFF777777),
                                  fontSize: fontSizeJob * 0.9,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: paddingValue * 6),
                          child: Row(
                            children: [
                              const Icon(
                                IconsaxPlusLinear.money_add,
                                size: 18,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' جنية',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF20776B),
                                      fontSize: fontSizePrice,
                                      fontFamily: 'noto',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    widget.price_job,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF20776B),
                                      fontSize: fontSizePrice,
                                      fontFamily: 'noto',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: paddingValue),
                    child: Stack(
                      children: [
                        Container(
                          width: cardWidth * 0.3, // 30% of card width
                          height: cardHeight * 0.5, // 50% of card height
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.83),
                            ),
                            image: DecorationImage(
                              image: AssetImage(widget.photo_card),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: cardWidth * 0.3,
                          height: cardHeight * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(17.83),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: cardWidth * 0.7), // 70% of card width for button
                child: Container(
                  width: 45,
                  height: 25,
                  decoration: ShapeDecoration(
                    color: const Color(0xff207768),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Icon(
                    IconsaxPlusLinear.arrow_left,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
