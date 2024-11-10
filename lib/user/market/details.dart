import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';
import 'package:sahelnahaa/user/market/counter.dart';
import 'package:sahelnahaa/user/market/market_view.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the screen size to use for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Helper function for responsive width and height
    double wp(double width) => width * screenWidth / 430;
    double hp(double height) => height * screenHeight / 932;
    double sp(double size) => size * screenWidth / 430;

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        leading: Icon(
          IconsaxPlusLinear.arrow_left_1,
          color: Colors.black,
          size: sp(24),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: wp(20)),
            child: Icon(
              IconsaxPlusLinear.heart,
              color: Colors.black,
              size: sp(24),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: wp(306),
              height: hp(305),
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/shop/image 4.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(wp(22.58)),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    blurRadius: sp(16),
                    offset: Offset(0, hp(8)),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: hp(30)),
          Container(
            width: wp(430),
            height: hp(490),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(wp(48)),
                  topRight: Radius.circular(wp(48)),
                ),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: hp(32)),
                Row(
                  children: [
                    SizedBox(width: wp(35)),
                    Icon(
                      IconsaxPlusBold.star,
                      color: Colors.amber,
                      size: sp(16),
                    ),
                    SizedBox(width: wp(3)),
                    Text(
                      '4.9',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: sp(16),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: wp(125)),
                    Text(
                      'مروحة 3 ريشة',
                      style: TextStyle(
                        color: const Color(0xFF20776B),
                        fontSize: sp(28),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: wp(371),
                  height: hp(29),
                  child: Text(
                    'مروحه بها منظم سرعات و مؤقت',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFFACA9A7),
                      fontSize: sp(16),
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: hp(30)),
                Row(
                  children: [
                    SizedBox(width: wp(20)),
                    CustomCounter(),
                    SizedBox(width: wp(160)),
                    Text(
                      '45 دقيقة',
                      style: TextStyle(
                        color: const Color(0xFFACA9A7),
                        fontSize: sp(16),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: wp(3)),
                    Icon(
                      IconsaxPlusLinear.timer_1,
                      color: const Color(0xFFACA9A7),
                      size: sp(16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: wp(305)),
                    Text(
                      'مجاني',
                      style: TextStyle(
                        color: const Color(0xFFACA9A7),
                        fontSize: sp(16),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: wp(3)),
                    Icon(
                      IconsaxPlusLinear.truck_fast,
                      color: const Color(0xFFACA9A7),
                      size: sp(16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: wp(29)),
                    Text(
                      '330 جنية',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF191919),
                        fontSize: sp(20),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: wp(10)),
                    Container(
                      width: wp(130),
                      height: hp(24),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF881A1A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(wp(16)),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'خصم 20% لفترة محدوده',
                          style: TextStyle(
                            color: const Color(0xFFD7C9C9),
                            fontSize: sp(10),
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: hp(18)),
                Divider(endIndent: wp(30), indent: wp(30)),
                SizedBox(
                  height: hp(10),
                ),
                Row(
                  children: [
                    SizedBox(width: wp(320)),
                    Text(
                      '(8)',
                      style: TextStyle(
                        color: const Color(0xFFACA9A7),
                        fontSize: sp(16),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: wp(3)),
                    Text(
                      'الآراء',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: sp(16),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: hp(6)),
                Row(
                  children: [
                    SizedBox(width: wp(30)),
                    for (int i = 0; i < 4; i++)
                      Icon(Icons.star, color: Colors.black, size: sp(16)),
                    Icon(Icons.star, color: Colors.grey, size: sp(16)),
                    SizedBox(width: wp(90)),
                    Text(
                      '2 weeks ago',
                      style: TextStyle(
                        color: const Color(0xFFACA9A7),
                        fontSize: sp(14),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: wp(3)),
                    Text(
                      'mohamed',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: sp(14),
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: wp(3)),
                    Container(
                      width: wp(24),
                      height: hp(24),
                      decoration: const ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: hp(5)),
                SizedBox(
                  width: wp(360),
                  height: hp(24),
                  child: Text(
                    'اشتريتها من اسبوعين وبصراحه قيمة مقابل سعر',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: sp(13),
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: hp(16)),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 350,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Icon(
                                  IconsaxPlusLinear.tick_circle,
                                  size: 110,
                                  color: Color(0xff207768),
                                ),
                                const Text(
                                  'تمت أضافته للسلة',
                                  style: TextStyle(
                                    color: Color(0xFC252525),
                                    fontSize: 24,
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  '1 إجمالي العناصر',
                                  style: TextStyle(
                                    color: Colors.black
                                        .withOpacity(0.699999988079071),
                                    fontSize: 14,
                                    fontFamily: 'noto',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MarketView(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 165,
                                        height: 53,
                                        padding: const EdgeInsets.all(6.29),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'تصفح المنتجات',
                                              style: TextStyle(
                                                color: Color(0xFF212121),
                                                fontSize: 15,
                                                fontFamily: 'noto',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CartView(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 165,
                                        height: 53,
                                        padding: const EdgeInsets.all(6.29),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF121212),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'الذهاب إلى السلة',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'noto',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFF207768),
                    radius: 30,
                    child: Icon(
                      IconsaxPlusLinear.add,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
