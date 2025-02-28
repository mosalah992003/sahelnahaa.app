// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/offers/offersview.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class PromoCard extends StatefulWidget {
  const PromoCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Offersview();
            }));
          },
          child: Container(
            width: double.infinity,
            height: 16.h, // Responsive height (35% of screen width)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5.h),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.5.h),
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
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            bool isActive = index == currentIndex;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: .7.w),
              child: Container(
                width: 2.w,
                height: 1.h,
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
