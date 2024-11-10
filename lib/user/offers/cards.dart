import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({required this.photo});
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 181,
      height: 154,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        image: DecorationImage(
          image: AssetImage(photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
