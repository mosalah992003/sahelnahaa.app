import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/logIn/log_in.dart'; // Ensure the LoginScreen is imported

class JoinUs extends StatefulWidget {
  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  bool isSpecialistSelected = false;
  bool isUserSelected = false;

  void toggleCardSelection(int cardIndex) {
    setState(() {
      if (cardIndex == 1) {
        isSpecialistSelected = !isSpecialistSelected;
        isUserSelected = false;
      } else if (cardIndex == 2) {
        isUserSelected = !isUserSelected;
        isSpecialistSelected = false;
      }
    });
  }

  void onProceed() {
    // Proceed only if the 'مستخدم' card is selected
    if (isUserSelected) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var tween = Tween<double>(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var rotationAnimation = animation.drive(tween);

            return RotationTransition(
              turns: rotationAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(
              milliseconds: 600), // Adjust the duration as needed
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('يرجى اختيار نوع الحساب أولاً!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 430,
              height: 932,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Stack(children: [
                Positioned(
                  left: -22,
                  top: -150,
                  child: Container(
                    width: 474,
                    height: 413,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF247A6E),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                const Positioned(
                  left: 257,
                  top: 669,
                  child: Text.rich(
                    TextSpan(),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Positioned(
                  left: 122,
                  top: 117,
                  child: SizedBox(
                    width: 187,
                    height: 31,
                    child: Text(
                      'انضم إلينا ک',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 275,
                  child: GestureDetector(
                    onTap: () => toggleCardSelection(1),
                    child: Container(
                      width: 280,
                      height: 240,
                      decoration: ShapeDecoration(
                        color: isSpecialistSelected
                            ? Color(0xFF207768)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.26),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4.38,
                            offset: Offset(0, 4.38),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'متخصص',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isSpecialistSelected
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                                fontSize: 21.88,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w600,
                                height: 0.9,
                              ),
                            ),
                          ),
                          Container(
                            width: 160.82,
                            height: 210,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Engineer-1--Streamline-Ux.png.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 528,
                  child: GestureDetector(
                    onTap: () => toggleCardSelection(2),
                    child: Container(
                      width: 280,
                      height: 240,
                      decoration: ShapeDecoration(
                        color:
                            isUserSelected ? Color(0xFF207768) : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'مستخدم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isUserSelected
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.7),
                              fontSize: 21,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w600,
                              height: 0.9,
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 210,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Avatar-1--Streamline-Ux.png (1).png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 800,
                  child: GestureDetector(
                    onTap: onProceed,
                    child: Container(
                      width: 370,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: isSpecialistSelected || isUserSelected
                            ? Color(0xFF207768)
                            : Colors.grey, // Grey if no card is selected
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 53,
                            height: 14,
                            child: Text(
                              'تقدم',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'noto',
                                fontWeight: FontWeight.w500,
                                height: 0.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
