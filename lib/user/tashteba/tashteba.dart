import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Tashteba extends StatelessWidget {
  const Tashteba({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff207768),
      appBar: AppBar(
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'تشطيبة',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 22,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02), // Padding based on screen height
        children: const [
          CustomTashteba2(
            day: '4 أيام',
            job: '   تركيب جميع أدوات السباكة ',
            photo_card: 'assets/cards/Select Inverse 1.png',
            price_job: '4200',
            title_crad: 'سباكة',
          ),
          CustomTashteba2(
              day: '12 أيام',
              job: '            دهان ونقاشة كاملة ',
              photo_card: 'assets/cards/22 1.png',
              price_job: "7500",
              title_crad: 'نقاشة'),
          CustomTashteba2(
              day: '3 أيام',
              job: ' تركيب الكهرباء والسعر للغرفة',
              photo_card: "assets/cards/55 1.png",
              price_job: "4000",
              title_crad: 'كهرباء'),
          CustomTashteba2(
              day: '20 أيام',
              job: '        تأسيس حداده و مقاولة',
              photo_card: "assets/cards/88 1.png",
              price_job: "50000",
              title_crad: 'حدادة'),
          CustomTashteba2(
              day: '3 أيام',
              job: 'تأسيس النجارة بجميع انواعها',
              photo_card: "assets/cards/336 1.png",
              price_job: "8000",
              title_crad: 'نجارة'),
          CustomTashteba2(
              day: '3 أيام',
              job: 'تركيب سيراميك والسعر للغرفة',
              photo_card: "assets/cards/44.png",
              price_job: "2000",
              title_crad: 'سيراميك'),
          CustomTashteba2(
              day: '3 أيام',
              job: '    تركيب ستائر والسعر للغرفة',
              photo_card: "assets/cards/11 1.png",
              price_job: "5000",
              title_crad: 'ديكور')
        ],
      ),
    );
  }
}

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
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: 10, right: screenWidth * 0.05, left: screenWidth * 0.05),
      child: Container(
        width: screenWidth * 0.95, // Width is 95% of screen width
        height: screenWidth * 0.45, // Responsive height
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
                        left: screenWidth * 0.04, right: screenWidth * 0.25),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isHeartPressed = !isHeartPressed;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.07, // Responsive width
                        height: screenWidth * 0.07, // Responsive height
                        decoration: BoxDecoration(
                          color: isHeartPressed
                              ? const Color(0xFF207768)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          IconsaxPlusLinear.heart,
                          size: screenWidth * 0.045, // Responsive icon size
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    // Use Expanded to handle text overflow
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.4),
                      child: Text(
                        widget.title_crad,
                        style: TextStyle(
                          color: const Color(0xFF1B2431),
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.47,
                        ),
                        textAlign:
                            TextAlign.right, // Right-align for Arabic text
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                endIndent: 18,
                indent: 18,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align left
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04),
                        child: Text(
                          widget.job,
                          style: TextStyle(
                            color: const Color(0xFF252525),
                            fontSize:
                                screenWidth * 0.035, // Responsive font size
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.25, top: 3, bottom: 3),
                        child: Row(
                          children: [
                            const Icon(
                              IconsaxPlusLinear.rotate_right,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.01), // Responsive spacing
                            Text(
                              widget.day,
                              style: TextStyle(
                                color: const Color(0xFF777777),
                                fontSize:
                                    screenWidth * 0.03, // Responsive font size
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.25),
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
                                    fontSize: screenWidth *
                                        0.035, // Responsive font size
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                    width: screenWidth *
                                        0.01), // Responsive spacing
                                Text(
                                  widget.price_job,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF20776B),
                                    fontSize: screenWidth *
                                        0.035, // Responsive font size
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
                  SizedBox(width: screenWidth * 0.02), // Responsive spacing
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.02),
                    child: Stack(
                      children: [
                        Container(
                          width: screenWidth * 0.30, // Responsive width
                          height: screenWidth * 0.25, // Responsive height
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
                          width: screenWidth * 0.30, // Responsive width
                          height: screenWidth * 0.25, // Responsive height
                          decoration: BoxDecoration(
                            color: Colors.black
                                .withOpacity(0.2), // Opacity overlay
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
                    right: screenWidth * 0.7), // Responsive padding
                child: Container(
                  width: screenWidth * 0.1, // Responsive width
                  height: screenWidth * 0.06, // Responsive height
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
