// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/market/market_view.dart';
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
  bool isLoading = true;

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
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
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
        elevation: 0,
        title: Text(
          'المفضلة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 5.w,
            fontFamily: 'noto',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF20776B),
                    Color(0xFF114A42),
                  ],
                ),
              ),
              child: favourites.isEmpty
                  ? _buildEmptyState()
                  : _buildFavouritesList(),
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/shop/freepik__background__98815.png',
            width: 70.w,
            height: 30.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 2.h),
          Text(
            'لا توجد عناصر في المفضلة',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          ElevatedButton.icon(
            icon: const Icon(Icons.add, color: Color(0xFF20776B)),
            label: Text(
              'إضافة للمفضلة',
              style: TextStyle(
                color: const Color(0xFF20776B),
                fontSize: 14.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.5.h),
              ),
              elevation: 2,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MarketView();
              }));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFavouritesList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'عناصر المفضلة (${favourites.length})',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final item = favourites[index];
                return _buildFavouriteCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavouriteCard(FavouriteItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(2.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.h),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Navigate to details page
            },
            splashColor: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Row(
                children: [
                  Container(
                    width: 22.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF114A42),
                      borderRadius: BorderRadius.circular(1.5.h),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1.5.h),
                      child: Image.asset(
                        item.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 0.5.h),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: Colors.white.withOpacity(0.7),
                              size: 2.h,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              'مضاف للمفضلة',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12.sp,
                                fontFamily: 'noto',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
                    onPressed: () => _showDeleteConfirmation(context, item),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, FavouriteItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.h),
          ),
          title: Column(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.amber,
                size: 6.h,
              ),
              SizedBox(height: 1.h),
              Text(
                "تنبيه",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "noto",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text(
            "هل تريد حذف ${item.title} من المفضلة؟",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "noto",
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5.h),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                      ),
                      onPressed: () {
                        _removeFromFavourites(item.title);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "حذف",
                        style: TextStyle(
                          fontFamily: "noto",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.5.h),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "إلغاء",
                        style: TextStyle(
                          fontFamily: "noto",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
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
