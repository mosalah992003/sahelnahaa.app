import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Prices extends StatefulWidget {
  const Prices({super.key});

  @override
  State<Prices> createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  // List of Arabic month names
  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  // Track the currently selected month
  int selectedMonthIndex = DateTime.now().month - 1; // Default to current month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView(
          children: [
            _buildHeader(),
            SizedBox(height: 6.h),
            _buildMonthSelector(),
            SizedBox(height: 4.h),
            _buildTransactionDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Text(
            'تفاصيل المبلغ المدفوع ',
            textAlign: TextAlign.right,
            style: _textStyle(
              color: const Color(0xFF272727),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: .1,
            ),
          ),
          SizedBox(width: 1.w),
          Container(
            width: 30.w,
            height: 4.5.h,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: const Color(0xff207768),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                '800 جنية',
                style: _textStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 7.h,
      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(months.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMonthIndex = index; // Update selected month
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: selectedMonthIndex == index
                    ? const Color(0xff207768) // Selected color
                    : Colors.grey[400], // Unselected color
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  months[index],
                  style: _textStyle(
                    color: selectedMonthIndex == index
                        ? Colors.white // White text for selected month
                        : Colors.black, // Black text for unselected months
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return Material(
      elevation: 1.5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(1.h),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFECECEC)),
            borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 2.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTransactionColumn(
                    header: 'نوع المعاملة',
                    items: ['نقدي', 'فودافون كاش', 'نقدي'],
                  ),
                  _buildTransactionColumn(
                    header: 'المبلغ',
                    items: ['70 جنية', '500 جنية', '230 جنية'],
                  ),
                  _buildTransactionColumn(
                    header: 'التاريخ',
                    items: ['2025_2_2', '2025_2_12', '2025_2_20'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionColumn(
      {required String header, required List<String> items}) {
    return Column(
      children: [
        Text(
          header,
          textAlign: TextAlign.center,
          style: _textStyle(
            color: const Color(0xFF1F635A),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 3.h),
        ...items
            .map((item) => Column(
                  children: [
                    Text(
                      item,
                      textAlign: TextAlign.center,
                      style: _textStyle(
                        color: const Color(0xFF1F1F1F),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ))
            // ignore: unnecessary_to_list_in_spreads
            .toList(),
      ],
    );
  }

  TextStyle _textStyle({
    required Color color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'noto',
      fontWeight: fontWeight,
      height: height,
    );
  }
}
