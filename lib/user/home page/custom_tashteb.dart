// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/tashteba/tashteba.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../removeFav.dart';

class CustomTashteb extends StatefulWidget {
  // ignore: use_super_parameters
  const CustomTashteb({
    required this.photo,
    required this.price,
    required this.tittle,
    Key? key,
  }) : super(key: key);

  final String photo;
  final String tittle;
  final String price;

  @override
  _CustomTashtebState createState() => _CustomTashtebState();
}

class _CustomTashtebState extends State<CustomTashteb> {
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorited = prefs.getBool(widget.tittle) ?? false;
    });
  }

  Future<void> _saveFavoriteState(bool isFavorited) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(widget.tittle, isFavorited);
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      _saveFavoriteState(isFavorited);
      if (isFavorited) {
        Favourite.addToFavourites(widget.tittle, widget.photo);
      } else {
        Favourite.removeFromFavourites(widget.tittle);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Tashteba(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 5.w, bottom: 5.h),
        child: Stack(
          children: [
            Container(
              width: 65.1.w,
              height: 27.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.h),
                    topRight: Radius.circular(3.h),
                    bottomLeft: Radius.circular(1.h),
                    bottomRight: Radius.circular(1.h),
                  ),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.h),
                  topRight: Radius.circular(3.h),
                ),
                child: Image.asset(
                  widget.photo,
                  width: 65.1.w,
                  height: 17.5.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.h),
                  topRight: Radius.circular(3.h),
                ),
                child: Container(
                  width: 65.1.w,
                  height: 17.5.h,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              left: 1.w,
              child: IconButton(
                onPressed: toggleFavorite,
                icon: Icon(
                  IconsaxPlusBold.heart,
                  color: isFavorited ? Colors.red : Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
            Positioned(
              bottom: 6.h,
              right: 2.w,
              child: Text(
                widget.tittle,
                style: TextStyle(
                  color: const Color(0xFF252525),
                  fontSize: 15.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              bottom: 1.5.h,
              left: 1.w,
              child: Row(
                children: [
                  Text(
                    ' جنية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 15.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: .6.w),
                  Text(
                    widget.price,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 15.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
