import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sahelnahaa/user/carts/cart_view.dart';
import 'package:sahelnahaa/user/market/counter.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
import 'package:sahelnahaa/user/market/star.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Details extends StatefulWidget {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String imagePath;

  const Details({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.imagePath,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isLiked = false;
  Color heartColor = Colors.grey;
  List reviews = [];
  int currentReviewIndex = 0;
  String userName = ''; // Variable to store the user's name
  String userImagePath = ''; // Variable to store the user's image path

  @override
  void initState() {
    super.initState();
    _loadSavedState();
    _loadReviews();
    _startReviewCarousel();
    _loadUserData(); // Load user data when the widget initializes
  }

  Future<void> _loadSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = prefs.getBool('${widget.productName}_isLiked') ?? false;
      heartColor = isLiked ? Colors.red : Colors.grey.withOpacity(.4);
    });
  }

  Future<void> _loadReviews() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      reviews = prefs.getStringList('reviews') ?? [];
    });
  }

  Future<void> _saveReview(String review) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      reviews.add(review);
      prefs.setStringList('reviews', reviews.cast<String>());
    });
  }

  void _startReviewCarousel() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          currentReviewIndex = (currentReviewIndex + 1) % reviews.length;
        });
        _startReviewCarousel();
      }
    });
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'User'; // Load the user's name
      userImagePath = prefs.getString('imagePath') ??
          'assets/images/profile.png'; // Load the user's image path
    });
  }

  void _showAddReviewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newReview = '';
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Center(
              child: Text(
                "أضف رأيك",
                style: TextStyle(
                  fontFamily: "noto",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: TextField(
              onChanged: (value) {
                newReview = value;
              },
              decoration: InputDecoration(
                hintText: "اكتب رأيك هنا",
                hintStyle: TextStyle(
                  fontFamily: "noto",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff20776b),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                        ),
                        onPressed: () {
                          if (newReview.isNotEmpty) {
                            _saveReview(newReview);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          "حفظ",
                          style: TextStyle(
                            fontFamily: "noto",
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "إلغاء",
                          style: TextStyle(
                            fontFamily: "noto",
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  width: double.infinity,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.h),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 8,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Image.asset(widget.imagePath),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.h),
                    topRight: Radius.circular(4.h),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff207768)),
                          ),
                          Row(
                            children: [
                              Text(
                                '4.9',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                IconsaxPlusBold.star,
                                color: Colors.amber,
                                size: 2.h,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        widget.productDescription,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                IconsaxPlusLinear.timer_1,
                                color: const Color(0xFFACA9A7),
                                size: 2.5.h,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                '45 دقيقة',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const CustomCounter(),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            IconsaxPlusLinear.truck_fast,
                            color: const Color(0xFFACA9A7),
                            size: 2.5.h,
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            'مجاني',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 35.w,
                            height: 3.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF881A1A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.h),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'خصم 20% لفترة محدوده',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            '${widget.productPrice} جنية',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Divider(endIndent: 10.w, indent: 10.w),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8.w,
                                height: 4.h,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(userImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: const OvalBorder(),
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                userName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 1.w),
                              IconButton(
                                icon: Icon(
                                  IconsaxPlusLinear.add_square,
                                  color: const Color(0xFF2B2B2B),
                                  size: 2.h,
                                ),
                                onPressed: _showAddReviewDialog,
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              StarRatingWidget(),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: .5.h),
                      Text(
                        reviews.isNotEmpty
                            ? reviews[currentReviewIndex]
                            : 'لا توجد تقييمات',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2.h),
                                    topRight: Radius.circular(2.h),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 4.h),
                                      Icon(
                                        IconsaxPlusLinear.tick_circle,
                                        size: 13.h,
                                        color: const Color(0xff207768),
                                      ),
                                      Text(
                                        'تمت أضافته للسلة',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontFamily: 'noto',
                                          fontWeight: FontWeight.w300,
                                          height: 0,
                                        ),
                                      ),
                                      Text(
                                        '1 إجمالي العناصر',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'noto',
                                          fontWeight: FontWeight.w300,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
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
                                                width: 40.w,
                                                height: 6.h,
                                                padding: EdgeInsets.all(1.h),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.h),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'تصفح المنتجات',
                                                      style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontFamily: 'noto',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
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
                                                width: 40.w,
                                                height: 6.h,
                                                padding: EdgeInsets.all(1.h),
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFF121212),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.h),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'الذهاب إلى السلة',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.sp,
                                                        fontFamily: 'noto',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: 10.h,
                          child: Stack(
                            children: [
                              Positioned(
                                right: 32.w,
                                left: 32.w,
                                top: 0,
                                child: Container(
                                  width: double.infinity,
                                  height: 9.h,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFF20776B),
                                    shape: OvalBorder(
                                      side: BorderSide(
                                        width: 4,
                                        color: Colors.white,
                                      ),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 37.w,
                                right: 37.w,
                                top: 2.5.h,
                                child: Icon(
                                  IconsaxPlusLinear.shopping_cart,
                                  size: 4.h,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: .4.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
