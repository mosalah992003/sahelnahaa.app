import 'package:flutter/material.dart';

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
      {'image': 'assets/cards/Sewing Machine.png', 'text': 'خياطة ملابس'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the number of columns based on the available width
          int columns =
              (constraints.maxWidth / 120).floor(); // Adjust column size
          double itemWidth = constraints.maxWidth / columns;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    borderRadius:
                        BorderRadius.circular(10), // Consistent border radius
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
                        // Responsive image size
                        Image.asset(
                          gridItems[index]['image']!,
                          width: itemWidth * 0.35, // 50% of item width
                          height: itemWidth * 0.33, // 40% of item width
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 12),
                        // Responsive text size
                        Text(
                          gridItems[index]['text']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1B2431),
                            fontFamily: "noto",
                            fontSize:
                                itemWidth * .1, // Text size based on item width
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
