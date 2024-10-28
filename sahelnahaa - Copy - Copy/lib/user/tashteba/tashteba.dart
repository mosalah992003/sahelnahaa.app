import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/tashteba/custom_tashteba.dart';

class Tashteba extends StatelessWidget {
  const Tashteba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff207768),
      appBar: AppBar(
        backgroundColor: const Color(0xff207768),
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'تشطيبة',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 22,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: ListView(
        children: const [
          CustomTashteba2(
            day: '4 أيام',
            job: '   تركيب جميع أدوات السباكة ',
            photo_card: 'assets/cards/Select Inverse 1.png',
            price_job: '4200',
            title_crad: 'سباكة',
          ),
          CustomTashteba2(
              day: '12 أيام',
              job: '            دهان ونقاشة كاملة ',
              photo_card: 'assets/cards/22 1.png',
              price_job: "7500",
              title_crad: 'نقاشة'),
          CustomTashteba2(
              day: '3 أيام',
              job: ' تركيب الكهرباء والسعر للغرفة',
              photo_card: "assets/cards/55 1.png",
              price_job: "4000",
              title_crad: 'كهرباء'),
          CustomTashteba2(
              day: '20 أيام',
              job: '        تأسيس حداده و مقاولة',
              photo_card: "assets/cards/88 1.png",
              price_job: "50000",
              title_crad: 'حدادة'),
          CustomTashteba2(
              day: '3 أيام',
              job: 'تأسيس النجارة بجميع انواعها',
              photo_card: "assets/cards/336 1.png",
              price_job: "8000",
              title_crad: 'نجارة'),
          CustomTashteba2(
              day: '3 أيام',
              job: 'تركيب سيراميك والسعر للغرفة',
              photo_card: "assets/cards/44.png",
              price_job: "2000",
              title_crad: 'سيراميك'),
          CustomTashteba2(
              day: '3 أيام',
              job: '    تركيب ستائر والسعر للغرفة',
              photo_card: "assets/cards/11 1.png",
              price_job: "5000",
              title_crad: 'ديكور')
        ],
      ),
    );
  }
}
