import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sahelnahaa/user/profile/visa_container.dart';
import 'package:sahelnahaa/user/repair/repair_view.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'حفظ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 15,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.45,
                ),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF9F9F9),
          title: const Center(
            child: Text(
              'طرق الدفع',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF1B2431),
                fontSize: 22,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 240, bottom: 20),
              child: Text(
                'طرق دفع بنكية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Material(
              elevation: 6, // Adjust the elevation value as needed
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 390,
                height: 283,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const VisaContainer(
                        image: "assets/images/logos_visa.png",
                        name: "Visa Bank"),
                    const SizedBox(
                      height: 10,
                    ),
                    const VisaContainer(
                        image: "assets/images/Group 34249.png",
                        name: "Master card"),
                    const SizedBox(
                      height: 10,
                    ),
                    const VisaContainer(
                        image: "assets/images/image 38.png",
                        name: "Telda Card"),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 190,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(
                            IconsaxPlusLinear.add,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'أضافه طريقه اخرى ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF606060),
                            fontSize: 14,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 240),
              child: Text(
                'طرق دفع اخرى',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
                elevation: 6, // Adjust the elevation value as needed
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 390,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 35,
                          ),
                          Image.asset(
                            "assets/images/Gold coins and banknotes 3d cartoon style icon 1.png",
                            width: 65,
                            height: 65,
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Image.asset(
                            "assets/images/image 5.png",
                            width: 65,
                            height: 65,
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Image.asset(
                            "assets/images/image 7.png",
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 94,
                            child: Text(
                              'كاش عند الأستلام',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.699999988079071),
                                fontSize: 13,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 81.02,
                            child: Text(
                              'فودافون كاش',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.699999988079071),
                                fontSize: 13,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          SizedBox(
                            width: 63.74,
                            child: Text(
                              'اورانج كاش',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.699999988079071),
                                fontSize: 13,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Material(
                elevation: 6, // Adjust the elevation value as needed
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 390,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(IconsaxPlusLinear.arrow_left_1),
                      SizedBox(
                        width: 220,
                      ),
                      Text(
                        'العروض',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(IconsaxPlusLinear.ticket_discount)
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Material(
                elevation: 6, // Adjust the elevation value as needed
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RepairView();
                    }));
                  },
                  child: Container(
                    width: 390,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(IconsaxPlusLinear.arrow_left_1),
                        SizedBox(
                          width: 220,
                        ),
                        Text(
                          'الخدمات',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(LineAwesomeIcons.wrench_solid)
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
