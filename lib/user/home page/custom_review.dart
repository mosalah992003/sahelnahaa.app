import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CustomReview extends StatefulWidget {
  const CustomReview({super.key});

  @override
  State<CustomReview> createState() => _CustomReviewState();
}

class _CustomReviewState extends State<CustomReview> {
  List<String> reviews = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      reviews = prefs.getStringList('reviews') ?? [];
    });
  }

  Future<void> _saveReview(String review) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    reviews.add(review);
    await prefs.setStringList('reviews', reviews);
    setState(() {});
  }

  void _changeReview(int direction) {
    if (reviews.isNotEmpty) {
      setState(() {
        _currentIndex = (_currentIndex + direction) % reviews.length;
      });
    }
  }

  void _showAddReviewDialog() {
    TextEditingController reviewController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Center(
                child: Text("أضف رأيك",
                    style: TextStyle(
                      fontFamily: "noto",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ))),
            content: TextField(
              controller: reviewController,
              decoration: InputDecoration(
                  hintText: "اكتب رأيك هنا",
                  hintStyle: TextStyle(
                    fontFamily: "noto",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  )),
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
                          if (reviewController.text.isNotEmpty) {
                            _saveReview(reviewController.text);
                          }
                          Navigator.pop(context);
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: const Color(0xFFE1E1E1),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: .2.w, color: const Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.circular(3.h),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'أراء العملاء في الخدمة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h),
                if (reviews.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                              color: Colors.black, size: 2.5.h),
                          onPressed: () => _changeReview(-1),
                        ),
                        Expanded(
                          child: Text(
                            reviews[_currentIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 13.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios,
                              color: Colors.black, size: 2.5.h),
                          onPressed: () => _changeReview(1),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h, right: 70.w),
                  child: GestureDetector(
                    onTap: _showAddReviewDialog,
                    child: Container(
                      width: 8.w,
                      height: 3.5.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xff207768),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      child: Icon(
                        IconsaxPlusLinear.add,
                        color: Colors.white,
                        size: 3.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: reviews.isNotEmpty ? reviews.length : 1,
          position: _currentIndex, // Bind the active dot to _currentIndex
          decorator: DotsDecorator(
            size: Size.square(.8.h),
            activeSize: Size(1.9.h, 0.8.h),
            activeColor: const Color(0xff207768),
            color: Colors.grey,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.h),
            ),
          ),
        ),
        SizedBox(height: 7.h),
      ],
    );
  }
}
