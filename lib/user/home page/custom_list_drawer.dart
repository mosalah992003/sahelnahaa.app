import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/profile/callUs.dart';
import 'package:sahelnahaa/user/profile/notification.dart';
import 'package:sahelnahaa/user/profile/details.dart';
import 'package:sahelnahaa/user/profile/favourite.dart';
import 'package:sahelnahaa/user/profile/payment.dart';
import 'package:sahelnahaa/user/profile/politics.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CustomListDrawer extends StatelessWidget {
  const CustomListDrawer({super.key});

  Widget _buildDrawerItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    double iconSpacing = 5,
    double textSpacing = 85.0,
    Widget? destination,
  }) {
    return GestureDetector(
      onTap: destination != null
          ? () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              )
          : null,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, right: 4.w, left: 4.w),
        child: Container(
          width: double.infinity,
          height: 6.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.h),
            border: Border.all(
              color: const Color(0xFF207768),
              width: .1.h,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(IconsaxPlusLinear.arrow_left_1),
                Spacer(flex: textSpacing.toInt()),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.2.sp,
                    fontFamily: 'Noto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: iconSpacing),
                Icon(
                  icon,
                  color: const Color(0xff207768),
                  size: 2.5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDrawerItem(
          context: context,
          title: 'البيانات الشخصية',
          icon: IconsaxPlusBold.profile_circle,
          destination: const ProfileDetails(),
        ),
        _buildDrawerItem(
          context: context,
          title: 'التنبيهات',
          icon: IconsaxPlusBold.notification,
          textSpacing: 143.0,
          destination: const NotificationPage(),
        ),
        _buildDrawerItem(
          context: context,
          title: 'المفضلة',
          icon: IconsaxPlusBold.heart,
          textSpacing: 148.0,
          destination: const FavouritePage(),
        ),
        _buildDrawerItem(
          context: context,
          title: 'طرق الدفع',
          icon: IconsaxPlusBold.wallet_1,
          textSpacing: 130.0,
          destination: const Payment(),
        ),
        _buildDrawerItem(
          context: context,
          title: 'اتصل بنا',
          icon: IconsaxPlusBold.call,
          textSpacing: 150.0,
          destination: const Callus(),
        ),
        _buildDrawerItem(
          context: context,
          title: 'السياسات',
          icon: IconsaxPlusBold.security,
          textSpacing: 135.0,
          destination: const Politics(),
        ),
      ],
    );
  }
}
