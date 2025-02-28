// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/SharedPreferencesHelper.dart';
import 'package:sahelnahaa/user/repair/details/location_time.dart';
import 'package:sahelnahaa/user/repair/details/problemDetails.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Detailsview extends StatefulWidget {
  final String selectedService;

  const Detailsview({super.key, required this.selectedService});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsviewState createState() => _DetailsviewState();
}

class _DetailsviewState extends State<Detailsview> {
  final List<String> serviceNames = [
    'سباكة',
    'كهرباء',
    'نظافة',
    'نقاشة',
    'تكييف',
    'نجارة',
    'سيراميك',
    'تنجيد كراسي',
    'دش و تليفزيون',
    'صيانة ذكية',
    'بوتوجاز',
    'ثلاجات',
    'غسالات',
    'مبيض محارة',
    'مصاعد',
    'مكافحة الحشرات',
    'نقل اثاث',
    'ستائر',
    'كاميرات مراقبة',
    'زراعة',
    'مطابخ',
    'سجاد و موكيت',
    'مراتب و سراير',
  ];

  late String selectedService;

  @override
  void initState() {
    super.initState();
    selectedService = widget.selectedService;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 6.h, left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(IconsaxPlusLinear.arrow_left_1),
                  ),
                  SizedBox(width: 2.5.w),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7E7E7),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'إبحث عن خدمتك',
                            hintStyle: TextStyle(
                              color: const Color(0xFF676767),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon:
                                const Icon(IconsaxPlusLinear.search_normal),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 1.4.h),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              SizedBox(
                width: double.infinity,
                height: 6.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: serviceNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedService = serviceNames[index];
                        });
                        SharedPreferencesHelper.saveServiceName(
                            serviceNames[index]);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.5.w),
                        child: Container(
                          width: 30.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: selectedService == serviceNames[index]
                                ? const Color(0xFF207768)
                                : const Color(0xFFACA9A7),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Center(
                            child: Text(
                              serviceNames[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.5.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 2.h),
              _buildImageContainer("assets/shop/Group 39908.png"),
              SizedBox(height: 2.h),
              _buildImageContainer("assets/shop/Group 39905.png"),
              SizedBox(height: 2.h),
              _buildImageContainer("assets/shop/Group 39906.png"),
              SizedBox(height: 3.h),
              _buildSeparatorRow(),
              SizedBox(height: 3.h),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Problemdetails()),
                ),
                child: Container(
                  width: double.infinity,
                  height: 6.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE7E7E7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(IconsaxPlusLinear.arrow_left_1),
                      SizedBox(width: 2.w),
                      const Text(
                        'انشاء طلب ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
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
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LocationTime()),
      ),
      child: Container(
        width: double.infinity,
        height: 18.h,
        decoration: ShapeDecoration(
          color: Colors.black.withOpacity(0.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget _buildSeparatorRow() {
    return Row(
      children: [
        Opacity(
          opacity: 0.10,
          child: Container(
            width: 35.w,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          'غير ذلك',
          style: TextStyle(
            color: const Color(0xFF535353),
            fontSize: 15.sp,
            fontFamily: 'noto',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 2.w),
        Opacity(
          opacity: 0.10,
          child: Container(
            width: 35.w,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
            ),
          ),
        ),
      ],
    );
  }
}
