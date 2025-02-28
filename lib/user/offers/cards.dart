import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/details/location_time.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> gridItems = [
      {'image': "assets/shop/Group 34321.png"},
      {'image': "assets/shop/Group 34322.png"},
      {'image': "assets/shop/Group 34323.png"},
      {'image': "assets/shop/Group 34324.png"},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.4.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: .4.h,
          childAspectRatio: 1.16,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationTime()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.h),
              ),
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.h),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      gridItems[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
