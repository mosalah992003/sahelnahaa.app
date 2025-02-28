import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/widget/customCheckBox.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class WhyCancel extends StatelessWidget {
  const WhyCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView(
          children: [
            _buildHeader(),
            SizedBox(height: 5.h),
            _buildReasonList(),
            SizedBox(height: 4.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          "assets/shop/Feeling sorry-cuate 1.png",
          width: 60.w,
          height: 28.h,
        ),
        SizedBox(height: 1.h),
        Text(
          'من فضلك أخبرنا السبب المؤدي لإلغائك للحجز , نحن نقدر رأيك عن خدمتنا',
          textAlign: TextAlign.center,
          style: _textStyle(
            color: const Color(0xFF23334A),
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            height: 1.40,
            letterSpacing: -0.54,
          ),
        ),
      ],
    );
  }

  Widget _buildReasonList() {
    final reasons = [
      'لم أعد احتاج الخدمة',
      'لن أكون متوفر في هذا الموعد',
      'وجدت فنى بتقييم أفضل',
      'فعلت الطلب عن طريق الخطاء',
      'أخرى',
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: reasons.map((reason) => _buildReasonRow(reason)).toList(),
      ),
    );
  }

  Widget _buildReasonRow(String reason) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        children: [
          const CustomCheckbox(),
          SizedBox(width: 2.w),
          Text(
            reason,
            style: _textStyle(
              color: const Color(0xFF353535),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(
          text: 'لا تلغى الحجز',
          colors: const [Color(0xFF2A8C7F), Color(0xff207768)],
        ),
        _buildButton(
          text: 'إلغاء الحجز',
          colors: const [Color(0xFF8D2828), Color(0xFF663636)],
        ),
      ],
    );
  }

  Widget _buildButton({required String text, required List<Color> colors}) {
    return Container(
      width: 40.w,
      height: 5.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.66, 0.75),
          end: const Alignment(0.66, -0.75),
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(1.5.h),
      ),
      child: Center(
        child: Text(
          text,
          style: _textStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 1.71,
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle({
    required Color color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double letterSpacing = 0.0,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'noto',
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
