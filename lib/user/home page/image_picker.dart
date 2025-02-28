import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PicProfileImgWidget extends StatefulWidget {
  const PicProfileImgWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PicProfileImgWidgetState createState() => _PicProfileImgWidgetState();
}

class _PicProfileImgWidgetState extends State<PicProfileImgWidget> {
  String _selectedImagePath = '';

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedImagePath = prefs.getString('profile_image') ?? '';
    });
  }

  Future<void> _saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', path);
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.photo),
                title: const Text('Pick from gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.camera),
                title: const Text('Take a photo'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      log('Picked file path: ${pickedFile.path}');

      setState(() {
        _selectedImagePath = pickedFile.path;
      });

      // Save the selected image path
      await _saveImagePath(pickedFile.path);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image selected'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _showImagePickerOptions(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 7.h,
                    backgroundImage: _selectedImagePath.isEmpty
                        ? const AssetImage("assets/images/profile.png")
                        : kIsWeb
                            ? NetworkImage(_selectedImagePath)
                                as ImageProvider<Object>?
                            : FileImage(File(_selectedImagePath)),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width * .01,
                  backgroundColor: Colors.amber,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
