import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/market/details.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CustomCard extends StatefulWidget {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String imagePath;

  const CustomCard({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.imagePath,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isLiked = false;
  Color heartColor = Colors.grey.withOpacity(.4);

  Future<void> _toggleLike() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load existing liked items
    String? favString = prefs.getString('favourites');
    List<dynamic> jsonList = favString != null ? jsonDecode(favString) : [];
    List<Map<String, dynamic>> favourites =
        jsonList.map((e) => e as Map<String, dynamic>).toList();

    // Check if the item is already liked
    bool isAlreadyLiked = favourites.any(
      (item) => item['title'] == widget.productName,
    );

    if (isAlreadyLiked) {
      // Remove the item from the liked list
      favourites.removeWhere((item) => item['title'] == widget.productName);
    } else {
      // Add the item to the liked list
      favourites.add({
        'title': widget.productName,
        'photo': widget.imagePath,
      });
    }

    // Save the updated list back to SharedPreferences
    String jsonString = jsonEncode(favourites);
    await prefs.setString('favourites', jsonString);

    // Update the UI
    setState(() {
      isLiked = !isLiked;
      heartColor = isLiked ? Colors.red : Colors.grey.withOpacity(.4);
    });
  }

  Future<void> _addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load existing cart items
    String? cartString = prefs.getString('cart');
    List<dynamic> jsonList = cartString != null ? jsonDecode(cartString) : [];
    List<Map<String, dynamic>> cartItems =
        jsonList.map((e) => e as Map<String, dynamic>).toList();

    // Add the current product to the cart
    cartItems.add({
      'title': widget.productName,
      'description': widget.productDescription,
      'price': widget.productPrice,
      'image': widget.imagePath,
    });

    // Save the updated list back to SharedPreferences
    String jsonString = jsonEncode(cartItems);
    await prefs.setString('cart', jsonString);

    // Show a snackbar to indicate the product has been added to the cart
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xff207768),
        content: Center(
          child: Text(
            'تمت إضافة المنتج إلى السلة بنجاح',
            style: TextStyle(
              fontFamily: "noto",
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadLikedItems();
  }

  Future<void> _loadLikedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favString = prefs.getString('favourites');
    List<dynamic> jsonList = favString != null ? jsonDecode(favString) : [];
    List<Map<String, dynamic>> favourites =
        jsonList.map((e) => e as Map<String, dynamic>).toList();

    bool isAlreadyLiked = favourites.any(
      (item) => item['title'] == widget.productName,
    );

    setState(() {
      isLiked = isAlreadyLiked;
      heartColor = isLiked ? Colors.red : Colors.grey.withOpacity(.4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.5.h),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 16,
            offset: Offset(0, 2.26),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 1.h,
            left: -1.w,
            child: IconButton(
              icon: Icon(
                IconsaxPlusBold.heart,
                color: heartColor,
                size: 2.8.h,
              ),
              onPressed: _toggleLike,
            ),
          ),
          Positioned(
            top: 3.h,
            left: 8.w,
            right: 8.w,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      productName: widget.productName,
                      productDescription: widget.productDescription,
                      productPrice: widget.productPrice,
                      imagePath: widget.imagePath,
                    ),
                  ),
                );
              },
              child: Container(
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.5.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(.1.w),
                  child: Image.asset(widget.imagePath),
                ),
              ),
            ),
          ),
          Positioned(
            top: 19.h,
            left: 2.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السعر الحالى',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: .6.h),
                Text(
                  widget.productPrice,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 18.7.h,
            right: 2.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.productName,
                  style: TextStyle(
                    color: const Color(0xff207768),
                    fontSize: 15.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: .6.h),
                Text(
                  widget.productDescription,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25.h,
            right: 6.w,
            left: 6.w,
            child: GestureDetector(
              onTap: _addToCart,
              child: Container(
                height: 4.h,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF20776B), Color(0xFF3B7F76)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconsaxPlusLinear.shopping_cart,
                      color: Colors.white,
                      size: 2.h,
                    ),
                    SizedBox(width: 1.3.w),
                    Text(
                      'إضافة إلى السلة',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
