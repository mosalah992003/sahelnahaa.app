import 'package:flutter/material.dart';

class CustomRepair extends StatelessWidget {
  const CustomRepair({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> gridItems = [
      {'image': 'assets/cards/Group 34170.png', 'text': 'سباكة'},
      {'image': 'assets/cards/Group 34169.png', 'text': 'كهرباء'},
      {'image': 'assets/cards/Cleaning.png', 'text': 'نظافة'},
      {'image': 'assets/cards/Group.png', 'text': 'نقاشة'},
      {'image': 'assets/cards/Group 34171.png', 'text': 'تكييف'},
      {'image': 'assets/cards/Group 34177.png', 'text': 'نجارة'},
      {'image': 'assets/cards/Group 34174.png', 'text': 'سيراميك'},
      {'image': 'assets/cards/Group 34175.png', 'text': 'تنجيد كراسي'},
      {'image': 'assets/cards/Group 34178.png', 'text': 'دش و تليفزيون'},
      {'image': 'assets/cards/Group 34208.png', 'text': 'صيانة ذكية'},
      {'image': 'assets/cards/Group.png', 'text': 'بوتوجاز'},
      {'image': 'assets/cards/Sewing Machine.png', 'text': 'خياطة ملابس'},
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

    return ListView(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            itemCount: gridItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(190),
                  ),
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          gridItems[index]['image']!,
                          width: 51,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 13),
                        Text(
                          gridItems[index]['text']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1B2431),
                            fontFamily: "noto",
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
