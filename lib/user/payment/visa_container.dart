import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class VisaContainer2 extends StatelessWidget {
  const VisaContainer2({super.key, required this.image, required this.name});
  final String name;
  final String image;

  // Helper functions to make responsive adjustments
  double responsiveWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width * (width / 375); // base width
  }

  double responsiveHeight(BuildContext context, double height) {
    return MediaQuery.of(context).size.height * (height / 812); // base height
  }

  double responsiveFontSize(BuildContext context, double fontSize) {
    return MediaQuery.of(context).size.width *
        (fontSize / 375); // scale font size
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(context, 315),
      height: responsiveHeight(context, 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsiveWidth(context, 16)),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: responsiveWidth(context, 7),
          ),
          const Icon(
            IconsaxPlusLinear.record,
            color: Color(0xff207768),
          ),
          SizedBox(
            width: responsiveWidth(context, 40),
          ),
          Text(
            ' 9581 **** **** **** ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF606060),
              fontSize: responsiveFontSize(context, 13),
              fontWeight: FontWeight.w400,
              height: 1, // Adjusted line height for better font scaling
            ),
          ),
          SizedBox(
            width: responsiveWidth(context, 7),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF606060),
              fontSize: responsiveFontSize(context, 13),
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
          SizedBox(
            width: responsiveWidth(context, 7),
          ),
          Image.asset(
            image,
            width: responsiveWidth(context, 33),
            height: responsiveHeight(context, 16),
          ),
        ],
      ),
    );
  }
}
