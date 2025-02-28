// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Callus extends StatelessWidget {
  const Callus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        title: Center(
          child: Text(
            'اتصل بنا',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/Tech-Support-User-2-3--Streamline-Ux.png.png",
                        width: 50.w,
                        height: 18.h,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    _buildContactContainer(
                        IconsaxPlusBold.headphone, "0504763888"),
                    SizedBox(height: 2.h),
                    _buildDivider(),
                    SizedBox(height: 2.h),
                    _buildInfoContainer(IconsaxPlusLinear.profile, 'سهلناها'),
                    SizedBox(height: 1.h),
                    _buildInfoContainer(IconsaxPlusLinear.call, "01061124356"),
                    SizedBox(height: 1.h),
                    _buildInfoContainer(
                        IconsaxPlusLinear.message, "sahelnaha.co@gmail.com"),
                    SizedBox(height: 1.h),
                    _buildInfoContainer(IconsaxPlusLinear.map, 'المنصورة'),
                    SizedBox(height: 2.h),
                    _buildTextField(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: SizedBox(
              width: double.infinity,
              height: 6.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF20776B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  "assets/images/1.png",
                                  width: 25.w,
                                  height: 15.h,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                'تم إرسال أستفسارك بنجاح \nانتظر الرد قريبا...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF3F3D3D),
                                  fontSize: 16.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Text(
                  'إرسال',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'noto',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      height: 15.h,
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(1.h),
        border: Border.all(color: const Color(0xFFEBEBEB)),
      ),
      child: TextField(
        maxLines: null,
        expands: true,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: "...اكتب رسالتك هنا",
          hintStyle: TextStyle(
              fontFamily: "noto",
              fontSize: 15.sp,
              color: const Color(0xFF606060)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildContactContainer(IconData icon, String text) {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF20776B)),
          borderRadius: BorderRadius.circular(4.h),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 15.w,
            height: 6.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF20776B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.h),
                  bottomLeft: Radius.circular(4.h),
                ),
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 2.7.h),
          ),
          SizedBox(width: 20.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF20776B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Container(
          width: 40.w,
          decoration: const ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: .8, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Text(
          'أو',
          style: TextStyle(
            color: const Color(0xFF5D5252),
            fontSize: 14.sp,
            fontFamily: 'noto',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 3.w),
        Container(
          width: 40.w,
          decoration: const ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: .8, color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInfoContainer(IconData icon, String text) {
    return Container(
      width: double.infinity,
      height: 5.5.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFEBEBEB),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF5F5F5)),
          borderRadius: BorderRadius.circular(2.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 2.w),
          Icon(icon, size: 2.5.h),
        ],
      ),
    );
  }
}
