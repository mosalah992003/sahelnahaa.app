import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff207768),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 270,
            ),
            Image.asset(
              "assets/shop/figma (3) 1.png",
              width: 239,
              height: 239,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 275,
              child: Text(
                'امسح الQR لتسجيل حضورك للمستخدم',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
