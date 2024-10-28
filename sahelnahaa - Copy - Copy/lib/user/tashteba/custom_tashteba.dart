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
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Container(
        width: 390,
        height: 177,
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
                    padding: const EdgeInsets.only(left: 15, right: 120),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isHeartPressed = !isHeartPressed;
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: isHeartPressed
                              ? const Color(0xFF207768)
                              : Colors
                                  .grey, // Background color changes when pressed
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          IconsaxPlusLinear.heart,
                          size: 18,
                          color: isHeartPressed
                              ? Colors.white
                              : Colors.white, // Icon color remains white
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.title_crad,
                    style: const TextStyle(
                      color: Color(0xFF1B2431),
                      fontSize: 15.60,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.47,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          widget.job,
                          style: const TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 14.49,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 150, top: 3, bottom: 3),
                        child: Row(
                          children: [
                            const Icon(
                              IconsaxPlusLinear.rotate_right,
                              size: 18,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.day,
                              style: const TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 13.37,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 115),
                        child: Row(
                          children: [
                            const Icon(
                              IconsaxPlusLinear.money_add,
                              size: 18,
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                const Text(
                                  ' جنية',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF20776B),
                                    fontSize: 14.23,
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  widget.price_job,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF20776B),
                                    fontSize: 14.23,
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
                  const SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Container(
                          width: 118.11,
                          height: 94.71,
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
                          width: 118.11,
                          height: 94.71,
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
                padding: const EdgeInsets.only(right: 280),
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
