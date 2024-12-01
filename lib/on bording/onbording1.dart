import 'package:flutter/material.dart';
import 'package:sahelnahaa/on%20bording/assests.dart';
import 'package:sahelnahaa/on%20bording/choose.dart';
import 'package:sahelnahaa/on%20bording/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DoorHubOnboardingScreen extends StatefulWidget {
  const DoorHubOnboardingScreen({Key? key}) : super(key: key);

  @override
  DoorHubOnboardingScreenState createState() => DoorHubOnboardingScreenState();
}

class DoorHubOnboardingScreenState extends State<DoorHubOnboardingScreen> {
  int _currentPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        actions: [
          // Show the Skip button only if it's not the third page
          if (_currentPageIndex != 2)
            SkipButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JoinUs()),
                );
              },
            ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingList.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingCard(
                  playAnimation: true,
                  onboarding: onboardingList[index],
                );
              },
            ),
          ),
          // Show the dot indicator only if it's not the third page
          if (_currentPageIndex != 2)
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingList.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: const Color(0xFF207768).withOpacity(0.2),
                activeDotColor: const Color(0xFF207768),
              ),
              onDotClicked: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          const SizedBox(height: 35),
          (_currentPageIndex < onboardingList.length - 1)
              ? Container()
              : PrimaryButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinUs()),
                    );
                  },
                  text: 'ابدأ الآن',
                ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const PrimaryButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.9;
    final double height = 50.0;
    final double borderRadius = 10.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15,
            fontFamily: "noto",
          ),
        ),
      ),
    );
  }
}

class OnboardingCard extends StatefulWidget {
  final bool playAnimation;
  final Onboarding onboarding;

  const OnboardingCard({
    required this.playAnimation,
    Key? key,
    required this.onboarding,
  }) : super(key: key);

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeAnimationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.easeInOut,
    ));

    if (widget.playAnimation) {
      _slideAnimationController.forward();
      _fadeAnimationController.forward();
      _scaleAnimationController.forward();
    } else {
      _slideAnimationController.animateTo(1,
          duration: const Duration(milliseconds: 0));
      _fadeAnimationController.animateTo(1,
          duration: const Duration(milliseconds: 0));
      _scaleAnimationController.animateTo(1,
          duration: const Duration(milliseconds: 0));
    }
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    _fadeAnimationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.85;
    final double imageHeight = 450;

    return SlideTransition(
      position: _slideAnimation,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  widget.onboarding.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "noto",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.onboarding.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "noto",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 23),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  child: Image.asset(
                    widget.onboarding.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.kAccent4,
          ),
          child: const Text(
            'تخطي',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: "noto",
            ),
          ),
        ),
      ),
    );
  }
}

class Onboarding {
  final String title;
  final String description;
  final String image;

  Onboarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

final onboardingList = [
  Onboarding(
    description:
        'خدمة 24 ساعه لجميع عملائنا ,حدد موعدك المناسب مع المختص المختار ',
    image: AppAssets.kOnboardingFirst,
    title: 'نملك جميع المتخصصين لمساعدتك',
  ),
  Onboarding(
    description: 'كل العناوين و المعلومات المدخله ستحفظ بالكامل في سرية تامه ',
    image: AppAssets.kOnboardingSecond,
    title: 'حافظ علي سريتك ,حدد موقعك',
  ),
  Onboarding(
    description: 'عند التسجيل يمكن الاستفادة من جميع خدماتنا المتميزه ',
    image: AppAssets.kOnboardingThird,
    title: 'سجل معنا وابدأ مباشرةً',
  ),
];
