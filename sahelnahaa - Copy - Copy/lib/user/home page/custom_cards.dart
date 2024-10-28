import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

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
    ];

    return Container(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
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
                      width: 52,
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
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
    );
  }
}
