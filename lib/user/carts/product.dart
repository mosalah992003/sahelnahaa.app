import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Product extends StatefulWidget {
  final Function onQuantityChanged; // Callback for quantity changes

  const Product({super.key, required this.onQuantityChanged});

  @override
  // ignore: library_private_types_in_public_api
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _getCartItems();
  }

  Future<void> _getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartString = prefs.getString('cart');
    List<dynamic> jsonList = cartString != null ? jsonDecode(cartString) : [];
    setState(() {
      cartItems = jsonList.map((e) => e as Map<String, dynamic>).toList();
    });
  }

  Future<void> _updateItemQuantity(int index, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartItems[index]['quantity'] = quantity; // Update the quantity
    String jsonString = jsonEncode(cartItems);
    await prefs.setString('cart', jsonString);
    setState(() {});
    widget.onQuantityChanged(); // Notify CartView to recalculate totals
  }

  Future<void> _removeItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartItems.removeAt(index); // Remove the item at the specified index
    String jsonString = jsonEncode(cartItems);
    await prefs.setString('cart', jsonString);
    setState(() {});
    widget.onQuantityChanged(); // Notify CartView to recalculate totals
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: Future.value(cartItems),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Show image when cart is empty
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/shop/Empty-pana.png', // Replace with your image path
                  width: 70.w,
                  height: 17.h,
                ),
                SizedBox(height: 2.h),
                Text(
                  'عربة التسوق فارغة',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF191919),
                  ),
                ),
              ],
            ),
          );
        } else {
          List<Map<String, dynamic>> cartItems = snapshot.data!;
          return SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var item = cartItems[index];
                int quantity = item['quantity'] ?? 1; // Default quantity is 1
                double unitPrice =
                    double.tryParse(item['price'].replaceAll(' جنية', '')) ??
                        0.0; // Parse price as double
                double totalPrice =
                    unitPrice * quantity; // Calculate total price

                return Container(
                  width: double.infinity,
                  height: 15.h,
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 8,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 2.w,
                        top: 1.h,
                        child: Container(
                          width: 30.w,
                          height: 13.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.h),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 3.w,
                        top: 1.h,
                        child: Text(
                          '$totalPrice جنية', // Display total price
                          style: TextStyle(
                            color: const Color(0xFF191919),
                            fontSize: 16.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2.w,
                        bottom: 1.h,
                        child: IconButton(
                          icon: Icon(
                            IconsaxPlusLinear.trash,
                            color: Colors.red,
                            size: 3.h,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Center(
                                  child: AlertDialog(
                                    backgroundColor: Colors.white,
                                    actions: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 2.h),
                                            Text(
                                              'هل تريد حذف هذا العنصر ؟',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xFF191919),
                                                fontSize: 18.sp,
                                                fontFamily: 'noto',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 3.h),
                                            GestureDetector(
                                              onTap: () async {
                                                await _removeItem(index);
                                                // ignore: use_build_context_synchronously
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 6.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                    vertical: 1.h),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment(-0.66, 0.75),
                                                    end: Alignment(0.66, -0.75),
                                                    colors: [
                                                      Color(0xFFE35C5C),
                                                      Color(0xFFE35C5C),
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 1.40,
                                                        color:
                                                            Color(0xFFC74949)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
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
                                                      'حذف',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFFF5F5F5),
                                                        fontSize: 17.sp,
                                                        fontFamily: 'noto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.06,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 6.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                    vertical: 1.h),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment(-0.66, 0.75),
                                                    end: Alignment(0.66, -0.75),
                                                    colors: [
                                                      Color(0xFFC5C5C5),
                                                      Color(0xFF747474),
                                                    ],
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 1.40,
                                                        color:
                                                            Color(0xFFE8E8E8)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
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
                                                      'إلغاء',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF282828),
                                                        fontSize: 17.sp,
                                                        fontFamily: 'noto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.06,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Positioned(
                        right: 3.5.w,
                        top: 1.7.h,
                        child: SizedBox(
                          width: 70.w,
                          height: 10.h,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 45.w,
                                  height: 6.h,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 1.w,
                                        top: 3.h,
                                        child: Text(
                                          item['description'],
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: const Color(0xFF848484),
                                            fontSize: 14.sp,
                                            fontFamily: 'noto',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 1.w,
                                        top: -.6.h,
                                        child: Text(
                                          item['title'],
                                          style: TextStyle(
                                            color: const Color(0xFF20776B),
                                            fontSize: 16.sp,
                                            fontFamily: 'noto',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // New Counter Implementation
                      Positioned(
                        bottom: 1.h,
                        right: 28.w,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) {
                                  _updateItemQuantity(index, quantity - 1);
                                }
                              },
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                _updateItemQuantity(index, quantity + 1);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
