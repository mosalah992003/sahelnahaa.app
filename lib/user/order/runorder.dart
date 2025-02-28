import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/order/star.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'dart:io'; // For handling File objects
import 'package:photo_view/photo_view.dart'; // For image zooming

class Runorder extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const Runorder({super.key, required this.onCancel, required this.onConfirm});

  @override
  State<Runorder> createState() => _RunorderState();
}

class _RunorderState extends State<Runorder> {
  File? _imageFile; // To store the selected image

  void _pickImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Use gallery for image selection
    );
    if (image != null) {
      setState(() {
        _imageFile = File(image.path); // Store the selected image
      });
    }
  }

  void _zoomImage(BuildContext context) {
    if (_imageFile != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: PhotoView(
              imageProvider: FileImage(_imageFile!),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      color: Colors.white,
      borderRadius: BorderRadius.circular(2.h),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: .5, color: Color(0xFFD6D4D4)),
            borderRadius: BorderRadius.circular(2.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عرض الملف الشخصي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 13.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      height: 1.20,
                      letterSpacing: -0.36,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconsaxPlusBold.star,
                        color: Colors.yellow,
                        size: 2.5.h,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '4.6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF705D5D),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w400,
                          height: 1.20,
                          letterSpacing: -0.27,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 1.h),
                          Text(
                            'محمد إبراهيم ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'سباكة',
                            style: TextStyle(
                              color: const Color(0xFF8E8E8E),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1.w),
                      Container(
                        width: 9.w,
                        height: 4.5.h,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'الموعد',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF8B8B8B),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: .5.h),
                      Row(
                        children: [
                          Text(
                            '3 ديسمبر - 10 صباحاً',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Icon(
                            IconsaxPlusBold.calendar,
                            color: const Color(0xff20776b),
                            size: 2.5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'السعر',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF8B8B8B),
                          fontSize: 14.sp,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: .5.h),
                      Row(
                        children: [
                          Text(
                            '70 جنية للمعاينة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Icon(
                            IconsaxPlusBold.dollar_circle,
                            color: const Color(0xff20776b),
                            size: 2.5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.onCancel,
                    child: Container(
                      width: 40.w,
                      height: 5.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(-0.66, 0.75),
                          end: const Alignment(0.66, -0.75),
                          colors: [
                            Colors.white.withOpacity(0.800000011920929),
                            Colors.white.withOpacity(0.800000011920929),
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.800000011920929),
                            Colors.white.withOpacity(0.800000011920929),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1.40, color: Color(0xFF20776B)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'إلغاء الحجز',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF20776B),
                            fontSize: 15.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                            height: 1.71,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showCompletionDialog(context);
                    },
                    child: Container(
                      width: 40.w,
                      height: 5.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-0.66, 0.75),
                          end: Alignment(0.66, -0.75),
                          colors: [
                            Color(0xFF2A8C7F),
                            Color(0xff207768),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1.40, color: Color(0xFF2DB09E)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'اكتمال الخدمة',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                            height: 1.71,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                children: [
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      'هذا الحجز مؤكد يمكنك إلغاءه قبل 12 ساعة من موعد بدايته',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: const Color(0xFF494949),
                        fontSize: 13.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Icon(
                    IconsaxPlusLinear.tick_circle,
                    color: Colors.green[600],
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
            ],
          ),
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onConfirm(); // Trigger the onConfirm callback
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text(
                    'حفظ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF454545),
                      fontSize: 15.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 1.20,
                      letterSpacing: -0.45,
                    ),
                  ),
                ),
                Text(
                  'طلب مكتمل ',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'noto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    IconsaxPlusLinear.close_circle,
                    size: 2.5.h,
                  ),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Container(
                      width: 100.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _imageFile == null
                          ? Text(
                              'إرفع صورة الفاتورة',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : GestureDetector(
                              onTap: () => _zoomImage(context),
                              child: Image.file(
                                _imageFile!,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'تعليقك على الخدمة',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    width: double.infinity,
                    height: 6.h,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, 0.00),
                        end: Alignment(-1, 0),
                        colors: [Color(0xFF20776B), Color(0xFF14534B)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.90),
                      ),
                    ),
                    child: const Center(child: StarRatingWidget2()),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
