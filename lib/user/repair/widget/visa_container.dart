import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/repair/widget/customCheckBox.dart';

class VisaContainerRepaire extends StatelessWidget {
  const VisaContainerRepaire(
      {super.key,
      required this.image,
      required this.name,
      required this.name2});
  final String name;
  final String image;
  final String name2;

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
        borderRadius: BorderRadius.circular(responsiveWidth(context, 8)),
        border: Border.all(
          color: Color(0xFFDADADA),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: responsiveWidth(context, 7),
          ),
          CustomCheckbox(),
          SizedBox(
            width: responsiveWidth(context, 20),
          ),
          Text(
            name2,
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
              fontFamily: "noto",
              fontSize: responsiveFontSize(context, 11),
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
