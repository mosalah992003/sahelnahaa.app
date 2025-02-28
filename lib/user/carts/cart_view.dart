import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/carts/product.dart';
import 'package:sahelnahaa/user/payment/payment.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double subtotal = 0.0;
  double discount = 100.0; // Example discount value
  double shipping = 0.0; // Free shipping
  double total = 0.0;
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _calculateTotals();
  }

  Future<void> _calculateTotals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartString = prefs.getString('cart');
    List<dynamic> jsonList = cartString != null ? jsonDecode(cartString) : [];
    cartItems = jsonList.map((e) => e as Map<String, dynamic>).toList();

    // Calculate subtotal
    double calculatedSubtotal = 0.0;
    for (var item in cartItems) {
      double price =
          double.tryParse(item['price'].replaceAll(' جنية', '')) ?? 0.0;
      int quantity = item['quantity'] ?? 1; // Default quantity is 1
      calculatedSubtotal += price * quantity;
    }

    // Calculate total
    double calculatedTotal = calculatedSubtotal - discount + shipping;

    setState(() {
      subtotal = calculatedSubtotal;
      total = calculatedTotal;
    });
  }

  Future<bool> _isCartEmpty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartString = prefs.getString('cart');
    List<dynamic> jsonList = cartString != null ? jsonDecode(cartString) : [];
    return jsonList.isEmpty;
  }

  Future<void> _saveTotalAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('totalAmount', total); // Save total amount
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        title: Center(
          child: Text(
            'السلة',
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ListView(
              children: [
                SizedBox(height: 3.h),
                Product(
                  onQuantityChanged:
                      _calculateTotals, // Pass callback to Product
                ),
                SizedBox(height: 3.h),
                // Pricing Details
                _buildPriceDetails(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 0.4,
            builder: (context, scrollController) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(3.h)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.all(2.h),
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Center(
                        child: Text(
                          'أدخل كود الخصم',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ادخل الكود هنا',
                          hintStyle: TextStyle(
                              fontFamily: "noto",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF20776B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                        child: Text(
                          'تطبيق',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "noto",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      children: [
        _buildPriceRow('جنية$subtotal ', 'المجموع', const Color(0xFFACA9A7)),
        Divider(height: 3.h),
        _buildPriceRow('جنية$discount ', 'الخصم', const Color(0xFFACA9A7)),
        Divider(height: 3.h),
        _buildPriceRow('مجانا', 'التوصيل', const Color(0xFFACA9A7)),
        Divider(height: 3.h),
        _buildPriceRow('$total جنية ', 'المجموع الكلي', const Color(0xFF20776B),
            fontWeight: FontWeight.w700, fontSize: 17.sp),
        SizedBox(height: 3.h),
        GestureDetector(
          onTap: () async {
            bool isEmpty = await _isCartEmpty();
            if (!isEmpty) {
              // Save total amount before navigating
              await _saveTotalAmount();
              // Navigate to payment page
              Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(builder: (context) => const Payment()),
              );
            } else {
              // Show a message or snackbar indicating the cart is empty
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color(0xff207768),
                  content: Center(
                      child: Text(
                    'السلة فارغة. أضف منتجات قبل الدفع.',
                    style: TextStyle(fontFamily: "noto", fontSize: 15.sp),
                  )),
                ),
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 6.h,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: ShapeDecoration(
              color: const Color(0xFF20776B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.h),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x07000000),
                  blurRadius: 15,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
              child: Text(
                'إكمال الدفع',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: "noto",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String amount, String label, Color color,
      {FontWeight fontWeight = FontWeight.w400, double fontSize = 16}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          amount,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: color,
            fontFamily: "noto",
            fontSize: 16.sp,
            fontWeight: fontWeight,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontFamily: "noto",
            fontSize: 16.sp,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
