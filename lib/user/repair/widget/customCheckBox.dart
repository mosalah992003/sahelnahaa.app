import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      checkColor: Colors.white,
      activeColor: Color(0xff207768),
      side: BorderSide(
        color: isChecked ? Colors.white : Colors.grey,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
