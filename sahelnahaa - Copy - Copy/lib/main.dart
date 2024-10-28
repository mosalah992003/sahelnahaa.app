import 'package:flutter/material.dart';
import 'package:sahelnahaa/splash/splash.dart';

void main() {
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
