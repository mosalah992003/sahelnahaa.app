import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/tashteba/details.dart';

class CustomTashteba extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomTashteba({required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Details(
                    image: "assets/shop/Group 34170.png",
                    image1: "assets/shop/Water Hydrant.png",
                    image2: "assets/shop/Group (2).png",
                    image3: "assets/shop/BACKGROUND_2.png",
                    text: 'تشطيب ادوات السباكة',
                    text1: '1-مواسير',
                    text2: '1-مطبخ',
                    text3: '1-حمام',
                    price: '5000 جنية',
                    time: '7 أيام',
                    profit1:
                        '  تركيب جميع المواسير و الصرف التابعة للمنزل كاملة  .',
                    profit2:
                        'تركيب جميع ادوات السباكة داخل الحمام شامل البانيو  .',
                    profit3:
                        '      تركيب سيراميك للحمام شامل الأرضية و الأسقف .',
                    profit4:
                        '   تركيب ادوات السباكة في المطبخ و تركيب السخان .',
                  ))),
          child: Container(
            width: 390,
            height: 462,
            padding: const EdgeInsets.all(24),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFE8E8E8),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFDFDFDF)),
                borderRadius: BorderRadius.circular(16),
              ),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
        ));
  }
}
