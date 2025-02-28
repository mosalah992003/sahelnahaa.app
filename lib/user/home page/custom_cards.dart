import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/details/detailsView.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> gridItems = [
      {'image': 'assets/cards/Group 34170.png', 'text': 'سباكة'},
      {'image': 'assets/cards/Group 34169.png', 'text': 'كهرباء'},
      {'image': 'assets/cards/Cleaning.png', 'text': 'نظافة'},
      {'image': 'assets/cards/nakasha.png', 'text': 'نقاشة'},
      {'image': 'assets/cards/Group 34171.png', 'text': 'تكييف'},
      {'image': 'assets/cards/Group 34177.png', 'text': 'نجارة'},
      {'image': 'assets/cards/Group 34174.png', 'text': 'سيراميك'},
      {'image': 'assets/cards/Group 34175.png', 'text': 'تنجيد كراسي'},
      {'image': 'assets/cards/Group 34205.png', 'text': 'مكواة'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 5.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: .4.h,
          childAspectRatio: .15.h,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to Detailsview and pass the selected service name
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailsview(
                    selectedService: gridItems[index]['text']!,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
              ),
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.h),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      gridItems[index]['image']!,
                      width: 11.w,
                      height: 5.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: .7.h),
                    Text(
                      gridItems[index]['text']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1B2431),
                        fontFamily: "noto",
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
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
