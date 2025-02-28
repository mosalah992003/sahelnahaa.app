// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Addimage extends StatefulWidget {
  const Addimage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddimageState createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  final List<XFile?> _images =
      List.filled(3, null); // Stores 3 different images

  Future<void> _pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _images[index] = pickedImage;
        });
      }
    } catch (e) {
      // Handle errors, e.g., permission denied
      debugPrint("Error picking image: $e");
    }
  }

  void _showZoomableImage(int index) {
    if (_images[index] == null) return;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: InteractiveViewer(
            child: Image.file(File(_images[index]!.path)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 16.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.2.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFE7E7E7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.h),
        ),
      ),
      child: Column(
        children: [
          Text(
            'أضف صورة ( اختياري )',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6E6C6C),
              fontSize: 14.3.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w400,
              height: 0.07,
              letterSpacing: -0.48,
            ),
          ),
          SizedBox(height: 3.3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: List.generate(3, (index) {
                return GestureDetector(
                  onTap: _images[index] == null
                      ? () => _pickImage(index)
                      : () => _showZoomableImage(index),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 14.5.w,
                        height: 6.5.h,
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        decoration: ShapeDecoration(
                          color: const Color(0xfff9f9f9),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFC0C0C0)),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                        child: _images[index] == null
                            ? Icon(
                                IconsaxPlusLinear.camera,
                                size: 3.h,
                                color: const Color(0xFF6E6C6C).withOpacity(0.5),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(1.h),
                                child: Image.file(
                                  File(_images[index]!.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                      ),
                      if (_images[index] == null)
                        Positioned(
                          bottom: -1.3.h,
                          left: 5.w,
                          child: Container(
                            width: 6.w,
                            height: 2.5.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff207768).withOpacity(.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 2.5.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
