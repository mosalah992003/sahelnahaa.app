import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PicProfileImgWidget extends StatefulWidget {
  const PicProfileImgWidget({super.key});

  @override
  _PicProfileImgWidgetState createState() => _PicProfileImgWidgetState();
}

class _PicProfileImgWidgetState extends State<PicProfileImgWidget> {
  String _selectedImagePath = '';

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
      log('Picked file path: ${pickedFile.path}'); // Log the file path
      log('Picked file name: ${pickedFile.name}'); // Log the file name, if needed

      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    } else {
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
                    radius: 45,
                    backgroundImage: _selectedImagePath.isEmpty
                        ? const AssetImage(
                            "assets/images/profile.png") // Fallback image URL
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
