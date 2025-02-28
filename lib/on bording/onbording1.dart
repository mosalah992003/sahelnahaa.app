import 'package:flutter/material.dart';
import 'package:sahelnahaa/on%20bording/assests.dart';
import 'package:sahelnahaa/on%20bording/choose.dart';
import 'package:sahelnahaa/on%20bording/color.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DoorHubOnboardingScreen extends StatefulWidget {
  // ignore: use_super_parameters
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
          SizedBox(width: 5.w),
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
                dotHeight: 1.h,
                dotWidth: 2.w,
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
          SizedBox(height: 5.h),
          (_currentPageIndex < onboardingList.length - 1)
              ? Container()
              : PrimaryButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => JoinUs()),
                    );
                  },
                  text: 'ابدأ الآن',
                ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  // ignore: use_super_parameters
  const PrimaryButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Container(
          height: 6.h,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kPrimary,
            borderRadius: BorderRadius.circular(1.h),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: "noto",
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingCard extends StatefulWidget {
  final bool playAnimation;
  final Onboarding onboarding;

  // ignore: use_super_parameters
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
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  widget.onboarding.title,
                  style: TextStyle(
                    fontSize: 19.4.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "noto",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),
                Text(
                  widget.onboarding.description,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: "noto",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 90.w,
                  height: 50.h,
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

  // ignore: use_super_parameters
  const SkipButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h),
              color: AppColors.kAccent4,
            ),
            child: Text(
              'تخطي',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: "noto",
              ),
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
