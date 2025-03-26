import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sahelnahaa/user/inbox/api.dart';
import 'package:uuid/uuid.dart';

class MessageController extends GetxController {
  var responseText = "".obs;
  var messages = <Map<String, dynamic>>[].obs;
  var isTypeing = false.obs;
  final Uuid _uuid = const Uuid();

  // Directory for storing files locally
  late Directory _appDirectory;

  @override
  void onInit() {
    super.onInit();
    _initDirectory();
  }

  Future<void> _initDirectory() async {
    _appDirectory = await getApplicationDocumentsDirectory();
  }

  // Method to send text messages
  Future<void> sendMessage(String message) async {
    messages.add(
      {
        'text': message,
        'isUser': true,
        'time': DateFormat('hh:mm a').format(DateTime.now())
      },
    );

    responseText.value = "Thinking..";
    isTypeing.value = true;
    update();

    String reply = await GooglleApiService.getApiResponse(message);

    responseText.value = reply;

    messages.add(
      {
        'text': reply,
        'isUser': false,
        'time': DateFormat('hh:mm a').format(DateTime.now())
      },
    );

    isTypeing.value = false;
    update();
  }

  // Method to send file messages (images, PDFs, etc.)
  Future<void> sendFileMessage({
    required File file,
    required String fileName,
    required String fileType,
  }) async {
    try {
      // Create a unique file name to avoid conflicts
      final String uniqueID = _uuid.v4();
      final String extension = path.extension(file.path);
      final String newFileName = '$uniqueID$extension';

      // Copy file to app's document directory for persistence
      final String localFilePath = path.join(_appDirectory.path, newFileName);
      final File localFile = await file.copy(localFilePath);

      // Add file message to the messages list
      messages.add({
        'fileName': fileName,
        'filePath': localFile.path,
        'fileType': fileType,
        'isUser': true,
        'time': DateFormat('hh:mm a').format(DateTime.now()),
      });

      // If it's an image, attempt to get a description from AI
      if (fileType == 'image') {
        // Send a placeholder message asking for response from AI
        isTypeing.value = true;
        update();

        // You can update this to include image analysis API in the future
        // For now, just send a simple acknowledgment message
        await Future.delayed(const Duration(seconds: 1));

        messages.add({
          'text': 'I received your image "$fileName".',
          'isUser': false,
          'time': DateFormat('hh:mm a').format(DateTime.now()),
        });

        isTypeing.value = false;
        update();
      } else if (fileType == 'pdf') {
        // Handle PDF response
        isTypeing.value = true;
        update();

        // Simple acknowledgment for PDF
        await Future.delayed(const Duration(seconds: 1));

        messages.add({
          'text': 'I received your PDF document "$fileName".',
          'isUser': false,
          'time': DateFormat('hh:mm a').format(DateTime.now()),
        });

        isTypeing.value = false;
        update();
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error sending file message: $e');
      Get.snackbar(
        'Error',
        'Failed to send file: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Future implementation for AI to analyze images
  // ignore: unused_element
  Future<String> _getImageResponse(String imagePath) async {
    // This would be replaced with actual AI image analysis API call
    // For now, return a placeholder response
    return "I've received your image. What would you like to discuss about it?";
  }
}
