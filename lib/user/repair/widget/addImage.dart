import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addimage extends StatefulWidget {
  const Addimage({super.key});

  @override
  _AddimageState createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  // Variable to hold the selected image
  XFile? _image;

  // Method to pick an image
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
      decoration: ShapeDecoration(
        color: const Color(0xFFE7E7E7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: 153,
            child: Text(
              'أضف صورة ( اختياري )',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6E6C6C),
                fontSize: 16,
                fontFamily: 'noto',
                fontWeight: FontWeight.w400,
                height: 0.07,
                letterSpacing: -0.48,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 60,
              ),
              GestureDetector(
                onTap: _pickImage, // Trigger the image picking on tap
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 56,
                      height: 54,
                      padding:
                          const EdgeInsets.only(top: 14, left: 16, right: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xfff9f9f9),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFC0C0C0)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: 14,
                            left: 0,
                            right: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 24,
                              color: const Color(0xFF6E6C6C).withOpacity(0.5),
                            ),
                          ),
                          Positioned(
                            bottom: -12,
                            left: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: const Color(0xff207768).withOpacity(.6),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: _pickImage, // Trigger the image picking on tap
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 56,
                      height: 54,
                      padding:
                          const EdgeInsets.only(top: 14, left: 16, right: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xfff9f9f9),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFC0C0C0)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: 14,
                            left: 0,
                            right: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 24,
                              color: const Color(0xFF6E6C6C).withOpacity(0.5),
                            ),
                          ),
                          Positioned(
                            bottom: -12,
                            left: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: const Color(0xff207768).withOpacity(.6),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              GestureDetector(
                onTap: _pickImage, // Trigger the image picking on tap
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 56,
                      height: 54,
                      padding:
                          const EdgeInsets.only(top: 14, left: 16, right: 16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFC0C0C0)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Positioned(
                            bottom: 14,
                            left: 0,
                            right: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 24,
                            ),
                          ),
                          Positioned(
                            bottom: -12,
                            left: 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: Color(0xff207768),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Display the picked image if any
          if (_image != null)
            Image.file(
              File(_image!.path),
              height: 150,
            ),
        ],
      ),
    );
  }
}
