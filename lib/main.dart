import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sahelnahaa/splash/splash.dart';
import 'package:sahelnahaa/user/chatbot/const.dart';

void main() {
  Gemini.init(apiKey: GEMINI_API_KEY);

  runApp(sahelnahaa());
}

class sahelnahaa extends StatelessWidget {
  const sahelnahaa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
