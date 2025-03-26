import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:sahelnahaa/user/inbox/messagecontroller.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageController chatMessageController = Get.put(MessageController());
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Color primaryColor = const Color(0xFF207768);
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Listen to changes in messages and auto-scroll
    chatMessageController.messages.listen((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await Permission.storage.request();
    await Permission.photos.request();
    await Permission.camera.request();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (pickedImage != null) {
        final File imageFile = File(pickedImage.path);
        final String fileName = path.basename(pickedImage.path);

        // Sending the image message
        chatMessageController.sendFileMessage(
          file: imageFile,
          fileName: fileName,
          fileType: 'image',
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'فشل في اختيار الصورة: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> _pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        String fileName = path.basename(file.path);

        // Sending the PDF message
        chatMessageController.sendFileMessage(
          file: file,
          fileName: fileName,
          fileType: 'pdf',
        );
      }
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'فشل في اختيار ملف PDF: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إرفاق ملف',
              style: TextStyle(
                fontFamily: 'noto',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _attachmentOption(
                  icon: Icons.camera_alt_rounded,
                  label: 'الكاميرا',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                _attachmentOption(
                  icon: Icons.image_rounded,
                  label: 'المعرض',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                _attachmentOption(
                  icon: Icons.picture_as_pdf_rounded,
                  label: 'ملف PDF',
                  onTap: () {
                    Navigator.pop(context);
                    _pickPDF();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _attachmentOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'noto',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileContent(Map<String, dynamic> message) {
    final fileType = message['fileType'];
    final filePath = message['filePath'];
    final fileName = message['fileName'];

    if (fileType == 'image') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(filePath),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          if (fileName != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                fileName,
                style: TextStyle(
                  fontFamily: 'noto',
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
            ),
        ],
      );
    } else if (fileType == 'pdf') {
      return GestureDetector(
        onTap: () => _openPDFViewer(filePath, fileName),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[300]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.picture_as_pdf_rounded,
                color: Colors.red[700],
                size: 40,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName ?? 'مستند PDF',
                      style: const TextStyle(
                        fontFamily: 'noto',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'اضغط للعرض',
                      style: TextStyle(
                        fontFamily: 'noto',
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Text(
        message['text'] ?? 'ملف غير مدعوم',
        style: TextStyle(
          fontFamily: 'noto',
          fontSize: 14.0,
          color: message['isUser'] ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      );
    }
  }

  void _openPDFViewer(String filePath, String? fileName) {
    Get.to(() => Scaffold(
          appBar: AppBar(
            title: Text(
              fileName ?? 'مستند PDF',
              style: TextStyle(
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: primaryColor),
          ),
          body: PDFView(
            filePath: filePath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: false,
            pageSnap: true,
            defaultPage: 0,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "دردشة",
          style: TextStyle(
            fontFamily: 'noto',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 5.w,
          ),
        ),
        backgroundColor: const Color(0xfff9f9f9),
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 24.0),
                  itemCount: chatMessageController.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatMessageController.messages[index];
                    final isUser = message['isUser'];
                    final time = message['time'];
                    final hasFile = message['fileType'] != null;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: isUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              padding: hasFile
                                  ? const EdgeInsets.all(10)
                                  : const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 14),
                              decoration: BoxDecoration(
                                color: isUser ? primaryColor : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20),
                                  bottomLeft: isUser
                                      ? const Radius.circular(20)
                                      : const Radius.circular(0),
                                  bottomRight: isUser
                                      ? const Radius.circular(0)
                                      : const Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: isUser
                                        ? primaryColor.withOpacity(0.2)
                                        : Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: hasFile
                                  ? _buildFileContent(message)
                                  : Text(
                                      message['text'],
                                      style: TextStyle(
                                        fontFamily: 'noto',
                                        fontSize: 14.0,
                                        color: isUser
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, right: 6, left: 6),
                              child: Text(
                                time,
                                style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => chatMessageController.isTypeing.value
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                _buildTypingIndicator(),
                                const SizedBox(width: 8),
                                Text(
                                  "جارِ الكتابة...",
                                  style: TextStyle(
                                    fontFamily: 'noto',
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),

            // Message input field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: _showAttachmentOptions,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.attach_file_rounded,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                controller: messageController,
                                decoration: const InputDecoration(
                                  hintText: "اكتب رسالة...",
                                  hintStyle: TextStyle(
                                    fontFamily: 'noto',
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 12),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () => _pickImage(ImageSource.camera),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      if (messageController.text.isNotEmpty) {
                        chatMessageController
                            .sendMessage(messageController.text.trim());
                        messageController.clear();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Row(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
