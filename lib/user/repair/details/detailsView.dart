import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/repair/details/problemDetails.dart';

class Detailsview extends StatefulWidget {
  const Detailsview({super.key});

  @override
  _DetailsviewState createState() => _DetailsviewState();
}

class _DetailsviewState extends State<Detailsview> {
  final List<String> serviceNames = [
    'سباكة',
    'صيانة سيارات',
    'تنظيف منازل',
    'نقل اثاث',
    'تصليح كهرباء',
    'تركيب سباكة',
    'تنسيق حدائق',
    'دهان منازل',
    'ميكانيكي',
    'كهربائي',
    'نجار',
    'حداد',
    'تنظيف سجاد',
    'غسيل زجاج',
    'عزل اسطح',
    'تكييف',
    'صيانة غسالات',
    'صيانة ثلاجات',
    'تركيب ستائر',
    'تعقيم',
    'نقل عفش',
    'تأثيث',
    'تركيب مطابخ',
    'صيانة مكيفات'
  ];

  // Default selected service is 'سباكة'
  String selectedService = 'سباكة';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(IconsaxPlusLinear.arrow_left_1),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFE7E7E7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            '                                             ....إبحث عن خدمتك',
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 12,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: Icon(IconsaxPlusLinear.search_normal),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              width: 390,
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: serviceNames.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedService = serviceNames[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 118,
                        height: 60,
                        decoration: BoxDecoration(
                          color: selectedService == serviceNames[index]
                              ? Color(0xFF207768) // Selected color
                              : Color(0xFFACA9A7), // Default color
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            serviceNames[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 390,
              height: 157,
              decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.20000000298023224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/shop/Group 39908.png"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 390,
              height: 157,
              decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.20000000298023224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/shop/Group 39905.png"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 390,
              height: 157,
              decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.20000000298023224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/shop/Group 39906.png"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Opacity(
                  opacity: 0.10,
                  child: Container(
                    width: 144,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'غير ذلك',
                  style: TextStyle(
                    color: Color(0xFF535353),
                    fontSize: 16,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                    letterSpacing: -0.48,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Opacity(
                  opacity: 0.10,
                  child: Container(
                    width: 144,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Problemdetails(),
                  ),
                );
              },
              child: Container(
                width: 390,
                height: 56,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: ShapeDecoration(
                  color: Color(0xFFE7E7E7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(IconsaxPlusLinear.arrow_left_1),
                    SizedBox(
                      width: 230,
                    ),
                    Text(
                      'انشاء طلب ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        height: 0.09,
                        letterSpacing: -0.48,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
