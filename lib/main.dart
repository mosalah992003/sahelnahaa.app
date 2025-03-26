import 'package:flutter/material.dart';
import 'package:sahelnahaa/splash/splash.dart';
import 'package:screen_go/models/screen_go_model.dart';
import 'package:screen_go/screen_go.dart';

void main() {
  runApp(const sahelnahaa());
}

// ignore: camel_case_types
class sahelnahaa extends StatelessWidget {
  const sahelnahaa({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenGo(
      materialApp: true,
      builder: (BuildContext context, ScreenGoModel deviceInfo) {
        // ignore: prefer_const_constructors
        return MaterialApp(
          debugShowCheckedModeBanner:
              false, // Optional: Removes the debug banner
          // ignore: prefer_const_constructors
          home: SplashScreen(),
        );
      },
    );
  }
}
