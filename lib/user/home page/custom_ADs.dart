import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/offers/offersview.dart';

class PromoCard extends StatefulWidget {
  const PromoCard({super.key});

  @override
  _PromoCardState createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  final List<String> images = [
    "assets/images/Frame 1261154589.png",
    "assets/images/Frame 1261154589 (1).png",
    "assets/images/Frame 1261154589 (2).png",
    "assets/images/Frame 1261154589 (3).png",
  ];

  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Offersview();
            }));
          },
          child: Container(
            width: screenWidth,
            height:
                screenWidth * 0.35, // Responsive height (35% of screen width)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Image.asset(
                  images[currentIndex],
                  key: ValueKey<int>(currentIndex),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            bool isActive = index == currentIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.5),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF207768) : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
