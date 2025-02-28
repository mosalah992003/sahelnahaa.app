import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/details/detailsView.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

// Assume you have a DetailsView page
class DetailsView extends StatelessWidget {
  final String serviceName;
  final String serviceImage;

  const DetailsView(
      {super.key, required this.serviceName, required this.serviceImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              serviceImage,
              width: 11.w,
              height: 5.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: .7.h),
            Text(
              'Details for $serviceName',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRepair extends StatelessWidget {
  const CustomRepair({super.key});

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
      {'image': 'assets/cards/Group 34178.png', 'text': 'دش و تليفزيون'},
      {'image': 'assets/cards/Group 34208.png', 'text': 'صيانة ذكية'},
      {'image': 'assets/cards/Group.png', 'text': 'بوتوجاز'},
      {'image': 'assets/cards/Group 34202.png', 'text': 'غسالات'},
      {'image': 'assets/cards/Group 34206.png', 'text': 'مبيض محارة'},
      {'image': 'assets/cards/Group 34205.png', 'text': 'مكواة'},
      {'image': 'assets/cards/Group (1).png', 'text': 'مكافحة الحشرات'},
      {'image': 'assets/cards/Group 34207.png', 'text': 'نقل اثاث'},
      {'image': 'assets/cards/Group (3).png', 'text': 'ستائر'},
      {'image': 'assets/cards/Group 34210.png', 'text': 'كاميرات مراقبة'},
      {'image': 'assets/cards/Group 34213.png', 'text': ' زراعة'},
      {'image': 'assets/cards/Group 34209.png', 'text': 'مطابخ'},
      {'image': 'assets/cards/Group 34215.png', 'text': 'سجاد و موكيت'},
      {'image': 'assets/cards/Group 34214.png', 'text': 'مراتب و سراير'},
      {'image': 'assets/cards/Group 34216.png', 'text': 'مصاعد'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 3.h,
                right: 5.w,
                left: 5.w,
                bottom: 5.h,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.w,
                  mainAxisSpacing: .4.h,
                  childAspectRatio: 0.13.h,
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to DetailsView when card is tapped
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
                        borderRadius: BorderRadius.circular(2.h),
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
                              width: 10.w, // Reduced size
                              height: 5.h,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              gridItems[index]['text']!,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1B2431),
                                fontFamily: "noto",
                                fontSize: 13.5.sp,
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
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        );
      },
    );
  }
}
