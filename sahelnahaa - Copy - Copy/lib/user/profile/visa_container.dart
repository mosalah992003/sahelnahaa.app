import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class VisaContainer extends StatelessWidget {
  const VisaContainer({required this.image, required this.name});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(16), // Circular radius
        border: Border.all(
          color: Colors.grey, // Border color in hex
          width: 1, // Adjust the border width as needed
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 7,
          ),
          const Icon(
            IconsaxPlusLinear.record,
            color: Color(0xff207768),
          ),
          const SizedBox(
            width: 60,
          ),
          const Text(
            ' 9581 **** **** **** ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF606060),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF606060),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Image.asset(
            image,
            width: 33,
            height: 16,
          )
        ],
      ),
    );
  }
}
