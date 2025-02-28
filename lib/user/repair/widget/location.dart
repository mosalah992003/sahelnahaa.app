import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/SharedPreferencesHelper.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _location = '٨ شارع احمد كامل الدقهليه';
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _location =
          prefs.getString('user_location') ?? '٨ شارع احمد كامل الدقهليه';
    });
  }

  Future<void> _updateLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_location', _locationController.text);
    await SharedPreferencesHelper.saveLocation(_locationController.text);
    if (mounted) {
      setState(() {
        _location = _locationController.text;
      });
      Navigator.of(context).pop(); // Close the dialog
    }
  }

  void _showEditDialog() {
    _locationController.text = _location;
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Center(
              child: Text(
                'تعديل العنوان',
                style: TextStyle(
                  fontFamily: "noto",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'أدخل العنوان الجديد',
                hintStyle: TextStyle(
                  fontFamily: "noto",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff20776b),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                        ),
                        onPressed: _updateLocation,
                        child: Text(
                          "حفظ",
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
                          backgroundColor: Colors.red.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
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
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(2.h),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Column(
                      children: [
                        Text(
                          'المنزل',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          _location,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.39,
                          ),
                        ),
                        Text(
                          'مصر',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.39,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        GestureDetector(
                          onTap: _showEditDialog,
                          child: Text(
                            'تعديل العنوان',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF20776B),
                              fontSize: 16.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.48,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                  Icon(
                    IconsaxPlusBold.tick_circle,
                    color: const Color(0xff207768),
                    size: 3.h,
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
