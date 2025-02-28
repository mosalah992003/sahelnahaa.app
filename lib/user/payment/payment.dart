import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/payment/success.dart';
import 'package:sahelnahaa/user/profile/credit.dart';
import 'package:sahelnahaa/user/profile/vodafonecash.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _loadTotalAmount(); // Load total amount when the page initializes
  }

  // Load total amount from SharedPreferences
  Future<void> _loadTotalAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      totalAmount = prefs.getDouble('totalAmount') ?? 0.0; // Load total amount
    });
  }

  // Method to validate input
  bool _validateInput() {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty) {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'الرجاء ملء جميع الحقول المطلوبة',
              style: TextStyle(
                fontFamily: "noto",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: const Color(0xff207768),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'الدفع',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.60,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 5.h,
            padding: EdgeInsets.all(1.h),
            decoration: const BoxDecoration(color: Color(0xFFEBE9E9)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                    color: const Color(0xFF6B6B6B),
                    fontSize: 16.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).size.height * 0.35, // Dynamic height
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w, vertical: 2.h), // Add vertical padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.h),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12, // Shadow color
                      blurRadius: 5, // Blur radius
                      spreadRadius: 2, // Spread radius
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  // Allow scrolling if content overflows
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First TextField for full name
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'الأسم كامل',
                          hintStyle: TextStyle(
                            fontFamily: "noto",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h), // Spacing between TextFields
                      // Second TextField for phone number
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: 'رقم الهاتف',
                          hintStyle: TextStyle(
                            fontFamily: "noto",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h), // Spacing between TextFields
                      // Third TextField for address
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          hintText: 'العنوان بالتفصيل',
                          hintStyle: TextStyle(
                            fontFamily: "noto",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: double.infinity,
            height: 5.h,
            padding: EdgeInsets.all(1.h),
            decoration: const BoxDecoration(color: Color(0xFFEAE9E9)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'طريقة الدفع',
                  style: TextStyle(
                    color: const Color(0xFF6B6B6B),
                    fontSize: 16.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const Credit(),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const VodafoneCash(),
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: const BoxDecoration(color: Color(0xFFF7F4FB)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.w,
                        height: 1.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF20776B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(1.h),
                              bottomRight: Radius.circular(1.h),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'الأجمالى',
                              style: TextStyle(
                                color: const Color(0xFF777777),
                                fontSize: 14.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.39,
                              ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text(
                              'جنية$totalAmount', // Display total amount
                              style: TextStyle(
                                color: const Color(0xFF20776B),
                                fontSize: 18.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                        ),
                        child: InkWell(
                          onTap: () {
                            // Validate input before navigating
                            if (_validateInput()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Success2(
                                    phoneNumber: _phoneController.text,
                                    address: _addressController.text,
                                    totalAmount: totalAmount,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 50.w,
                            height: 6.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF207768),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.h),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'التالي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'noto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.48,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
