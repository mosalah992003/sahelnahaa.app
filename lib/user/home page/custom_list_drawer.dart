import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/notification/notification.dart';
import 'package:sahelnahaa/user/profile/favourite.dart';
import 'package:sahelnahaa/user/profile/payment.dart';
import 'package:sahelnahaa/user/profile/politics.dart';
import 'package:sahelnahaa/user/profile/saved_location.dart';

class CustomListDrawer extends StatelessWidget {
  const CustomListDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 285,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(16), // Circular radius
                  border: Border.all(
                    color: const Color(0xFF207768), // Border color in hex
                    width: 1, // Adjust the border width as needed
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Icon(IconsaxPlusLinear.arrow_left_1),
                          SizedBox(
                            width: 85,
                          ),
                          Text(
                            'البيانات الشخصية',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            IconsaxPlusBold.profile_circle,
                            color: Color(0xff207768),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NotificationPage();
                  }));
                },
                child: Container(
                  width: 285,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(16), // Circular radius
                    border: Border.all(
                      color: const Color(0xFF207768), // Border color in hex
                      width: 1, // Adjust the border width as needed
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(IconsaxPlusLinear.arrow_left_1),
                            SizedBox(
                              width: 143,
                            ),
                            Text(
                              'التنبيهات',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              IconsaxPlusBold.notification,
                              color: Color(0xff207768),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Favourite();
                  }));
                },
                child: Container(
                  width: 285,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(16), // Circular radius
                    border: Border.all(
                      color: const Color(0xFF207768), // Border color in hex
                      width: 1, // Adjust the border width as needed
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(IconsaxPlusLinear.arrow_left_1),
                            SizedBox(
                              width: 148,
                            ),
                            Text(
                              'المفضلة',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              IconsaxPlusBold.heart,
                              color: Color(0xff207768),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: 285,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(16), // Circular radius
                  border: Border.all(
                    color: const Color(0xFF207768), // Border color in hex
                    width: 1, // Adjust the border width as needed
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Icon(IconsaxPlusLinear.arrow_left_1),
                          SizedBox(
                            width: 94,
                          ),
                          Text(
                            'الطلبات السابقة',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            IconsaxPlusBold.receipt,
                            color: Color(0xff207768),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SavedLocation();
                  }));
                },
                child: Container(
                  width: 285,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(16), // Circular radius
                    border: Border.all(
                      color: const Color(0xFF207768), // Border color in hex
                      width: 1, // Adjust the border width as needed
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(IconsaxPlusLinear.arrow_left_1),
                            SizedBox(
                              width: 66,
                            ),
                            Text(
                              'العناويين المحفوظة',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              IconsaxPlusBold.location,
                              color: Color(0xff207768),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Payment();
                  }));
                },
                child: Container(
                  width: 285,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(16), // Circular radius
                    border: Border.all(
                      color: const Color(0xFF207768), // Border color in hex
                      width: 1, // Adjust the border width as needed
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(IconsaxPlusLinear.arrow_left_1),
                            SizedBox(
                              width: 130,
                            ),
                            Text(
                              'طرق الدفع',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              IconsaxPlusBold.wallet_1,
                              color: Color(0xff207768),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: 285,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(16), // Circular radius
                  border: Border.all(
                    color: const Color(0xFF207768), // Border color in hex
                    width: 1, // Adjust the border width as needed
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Icon(IconsaxPlusLinear.arrow_left_1),
                          SizedBox(
                            width: 150,
                          ),
                          Text(
                            'أتصل بنا',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            IconsaxPlusBold.call,
                            color: Color(0xff207768),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Politics();
                  }));
                },
                child: Container(
                  width: 285,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(16), // Circular radius
                    border: Border.all(
                      color: const Color(0xFF207768), // Border color in hex
                      width: 1, // Adjust the border width as needed
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(IconsaxPlusLinear.arrow_left_1),
                            SizedBox(
                              width: 78,
                            ),
                            Text(
                              'سياسة الخصوصية',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              IconsaxPlusBold.lock,
                              color: Color(0xff207768),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
