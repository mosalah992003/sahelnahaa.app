import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Politics extends StatelessWidget {
  const Politics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF9F9F9),
          title: Center(
            child: Text(
              'سياسة الخصوصية',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF1B2431),
                fontSize: 18.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Image.asset(
                "assets/images/Group 34247.png",
                width: 50.w,
                height: 18.h,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'نحن في ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'سهلناها',
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' نلتزم بحماية خصوصيتك وضمان سرية بياناتك الشخصية. تم تصميم سياسة الخصوصية هذه لشرح كيفية جمع واستخدام ومشاركة المعلومات التي تقدمها لنا.',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '١.جمع المعلومات\n',
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        'نقوم بجمع المعلومات الشخصية التي تزودنا بها عند استخدامك للبرنامج، مثل الاسم، والبريد الإلكتروني، والعنوان، وغيرها من المعلومات الضرورية لتقديم الخدمة.',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '٢.استخدام المعلومات\n',
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        'يتم استخدام المعلومات التي نجمعها لتزويدك بالخدمات، وتحسين تجربة المستخدم، وتطوير الميزات الجديدة، وتقديم الدعم الفني.',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '٣.مشاركة المعلومات\n',
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        'لن نشارك معلوماتك الشخصية مع أي طرف ثالث بدون موافقتك، إلا في حالات تتطلبها القوانين أو لحماية حقوقنا.',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '٤.أمان المعلومات\n',
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        'نحرص على اتخاذ التدابير الأمنية المناسبة لحماية بياناتك من الوصول غير المصرح به أو التعديل أو التدمير.',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '٥.التحديثات\n',
                    style: TextStyle(
                      color: const Color(0xFF20776B),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر، وسيتم إشعارك بأي تغييرات جوهرية من خلال البرنامج.\n',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8999999761581421),
                      fontSize: 16.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 2.h,
            ),
            const Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'بهذه السياسة، نحن نسعى لضمان الحفاظ على خصوصيتك وثقتك بنا',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF20776B),
                fontSize: 16.sp,
                fontFamily: 'noto',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
