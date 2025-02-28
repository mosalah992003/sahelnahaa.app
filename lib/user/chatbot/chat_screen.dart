import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Gemini gemini;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: '0', firstName: 'mohamed');
  ChatUser gemimiUser = ChatUser(
    id: '1',
    firstName: 'gemini',
    profileImage: "assets/images/profile.png",
  );

  // Boolean to track whether to show the image
  bool showImage = true;

  @override
  void initState() {
    super.initState();
    gemini = Gemini.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "أسالنى ",
            style: TextStyle(
              color: Color(0xFF1B2431),
              fontSize: 22,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the chat
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              // Display the image and text if showImage is true
              if (showImage)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/1520043790585-removebg-preview (1).png', // Update with your image path
                        height: 220, // Adjust height as needed
                        width: 220, // Adjust width as needed
                      ),
                      const Text(
                        'كيف يمكنني مساعدتك اليوم؟ ', // Replace with your desired text
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "noto",
                          color: Colors.black87, // Adjust text color as needed
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: _buildUi(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUi() {
    return DashChat(
      messageOptions: const MessageOptions(
        currentUserContainerColor: Color(0xff207768),
        messagePadding: EdgeInsets.all(10), // Padding within message bubbles
      ),
      inputOptions: InputOptions(
        trailing: [
          IconButton(
            onPressed: () {
              sendMediaMessage();
            },
            icon: const Icon(
              Icons.image,
              color: Color(0xff207768),
            ),
          )
        ],
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
      // Hide the image after sending a message
      showImage = false;
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini.streamGenerateContent(question, images: images).listen(
        // ignore: non_constant_identifier_names
        (Event) {
          ChatMessage? lastMessage = messages.firstOrNull;
          // ignore: unrelated_type_equality_checks
          if (lastMessage != null && lastMessage == gemimiUser) {
            lastMessage = messages.removeAt(0);
            String response = Event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                " ";
            lastMessage.text += response;
            setState(() {
              messages = [lastMessage!, ...messages];
            });
          } else {
            String response = Event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                " ";
            ChatMessage message = ChatMessage(
              user: gemimiUser,
              createdAt: DateTime.now(),
              text: response,
            );
            setState(() {
              messages = [message, ...messages];
            });
          }
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "اوصف الصورة",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: '',
            type: MediaType.image,
          ),
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}
