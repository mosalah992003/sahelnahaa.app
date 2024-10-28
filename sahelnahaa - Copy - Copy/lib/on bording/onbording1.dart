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
          SkipButton(
            onTap: () {},
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
              physics: const NeverScrollableScrollPhysics(),
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
          const SizedBox(height: 30),
          (_currentPageIndex < onboardingList.length - 1)
              ? NextButton(onTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                })
              : PrimaryButton(
                  onTap: () {
                    // Navigate to the Choosing page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinUs()),
                    );
                  },
                  width: 166,
                  text: 'ابدأ الآن',
                  textColor: Colors.white,
                ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  final bool isBorder;
  final Color? textColor;

  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.isBorder = false,
    this.fontSize,
    this.color,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        alignment: Alignment.center,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          color: color ?? AppColors.kPrimary,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: isBorder ? Border.all(color: AppColors.kHint) : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 15,
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
                  width: 330,
                  height: 450,
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

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColors.kPrimary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.navigate_next, size: 30, color: Colors.white),
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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return JoinUs();
          }));
        },
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
  String image;
  String title;
  String description;

  Onboarding(
      {required this.description, required this.image, required this.title});
}

List<Onboarding> onboardingList = [
  Onboarding(
    description:
        'خدمة 24 ساعه لجميع عملائنا ,حدد موعدك المناسب مع المختص المختار ',
    image: AppAssets.kOnboardingFirst,
    title: 'نملك جميع المتخصصين لمساعدتك',
  ),
  Onboarding(
    description: 'كل العناوين و المعلومات المدخله ستحفظ في نظام الأمان',
    image: AppAssets.kOnboardingSecond,
    title: 'جميع بياناتك و معلوماتك في أمان وفق الشروط',
  ),
  Onboarding(
    description: 'يمكنك البحث عن منتجك بإستخدام الكاميرا',
    image: AppAssets.kOnboardingThird,
    title: 'تسوق منتجاتك بسهوله الآن مع خدمه الذكاء الاصطناعي ',
  ),
];
