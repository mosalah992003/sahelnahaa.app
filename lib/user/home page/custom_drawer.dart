import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/home%20page/custom_list_drawer.dart';
import 'package:sahelnahaa/user/home%20page/image_picker.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String name = '';
  String phone = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'ابو صلاح';
      phone = prefs.getString('phone') ?? '01061124356';
      address = prefs.getString('address') ?? 'شارع احمد كامل الدقهليه';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 31.h,
            decoration: BoxDecoration(
              color: const Color(0xff207768),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3.h),
                bottomRight: Radius.circular(3.h),
              ),
            ),
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PicProfileImgWidget(),
                  SizedBox(height: 1.h),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    address,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFCDCDD3),
                      fontSize: 14.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomListDrawer(),
        ],
      ),
    );
  }
}
