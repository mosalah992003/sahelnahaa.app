// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<FavouriteItem> favourites = [];

  @override
  void initState() {
    super.initState();
    _loadFavourites();
  }

  Future<void> _loadFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favString = prefs.getString('favourites');
    if (favString != null) {
      List<dynamic> jsonList = jsonDecode(favString);
      setState(() {
        favourites = jsonList
            .map((e) => FavouriteItem.fromJson(e as Map<String, dynamic>))
            .toList();
      });
    }
  }

  Future<void> _saveFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(favourites.map((e) => e.toJson()).toList());
    await prefs.setString('favourites', jsonString);
  }

  void _removeFromFavourites(String title) {
    setState(() {
      favourites.removeWhere((item) => item.title == title);
    });
    _saveFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20776B),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF20776B),
        title: Center(
          child: Text(
            'المفضلة',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp, // Adjust font size as needed
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: favourites.isEmpty
            ? Center(
                child: Image.asset(
                  'assets/shop/freepik__background__98815.png',
                  width: 80.w, // Adjust width as needed
                  height: 30.h, // Adjust height as needed
                  fit: BoxFit.contain,
                ),
              )
            : ListView.builder(
                itemCount: favourites.length,
                itemBuilder: (context, index) {
                  final item = favourites[index];
                  return Container(
                    width: double.infinity,
                    height: 9.h,
                    margin: EdgeInsets.only(bottom: 2.h),
                    decoration: ShapeDecoration(
                      color: const Color(0xff20776b).withOpacity(.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.h),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3D000000),
                          blurRadius: 1,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 2.5.h,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(
                                      child: Text(
                                        "تنبيه",
                                        style: TextStyle(
                                          fontFamily: "noto",
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.red.shade700,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.h),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  _removeFromFavourites(
                                                      item.title);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "حذف",
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
                                                  backgroundColor:
                                                      const Color(0xff20776b),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.h),
                                                  ),
                                                ),
                                                onPressed: () =>
                                                    Navigator.pop(context),
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
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Flexible(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Container(
                          width: 20.w,
                          height: 9.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF114A42),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.63,
                                color: Color(0xFF124A42),
                              ),
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              item.photo,
                              width: 18.w,
                              height: 6.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class FavouriteItem {
  final String title;
  final String photo;

  FavouriteItem({required this.title, required this.photo});

  factory FavouriteItem.fromJson(Map<String, dynamic> json) {
    return FavouriteItem(
      title: json['title'] as String,
      photo: json['photo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'photo': photo,
    };
  }
}
