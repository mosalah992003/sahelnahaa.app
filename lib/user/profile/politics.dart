import 'package:flutter/material.dart';

class Politics extends StatelessWidget {
  const Politics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF9F9F9),
          title: const Center(
            child: Text(
              'سياسة الخصوصية',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF1B2431),
                fontSize: 22,
                fontFamily: 'noto',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                "assets/images/Group 34247.png",
                width: 180,
                height: 120,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 390,
              height: 101,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'نحن في ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.800000011920929),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: 'سهلناها',
                      style: TextStyle(
                        color: Color(0xFF20776B),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' نلتزم بحماية خصوصيتك وضمان سرية بياناتك الشخصية. تم تصميم سياسة الخصوصية هذه لشرح كيفية جمع واستخدام ومشاركة المعلومات التي تقدمها لنا.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.800000011920929),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 390,
              height: 95,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '١.جمع المعلومات\n',
                      style: TextStyle(
                        color: Color(0xFF20776B),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          'نقوم بجمع المعلومات الشخصية التي تزودنا بها عند استخدامك للبرنامج، مثل الاسم، والبريد الإلكتروني، والعنوان، وغيرها من المعلومات الضرورية لتقديم الخدمة.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 390,
              height: 102,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '٢.استخدام المعلومات\n',
                      style: TextStyle(
                        color: Color(0xFF20776B),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          'يتم استخدام المعلومات التي نجمعها لتزويدك بالخدمات، وتحسين تجربة المستخدم، وتطوير الميزات الجديدة، وتقديم الدعم الفني.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 390,
              height: 97,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '٣.مشاركة المعلومات\n',
                      style: TextStyle(
                        color: Color(0xFF20776B),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          'لن نشارك معلوماتك الشخصية مع أي طرف ثالث بدون موافقتك، إلا في حالات تتطلبها القوانين أو لحماية حقوقنا.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 390,
              height: 78,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '٤.أمان المعلومات\n',
                      style: TextStyle(
                        color: Color(0xFF20776B),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          'نحرص على اتخاذ التدابير الأمنية المناسبة لحماية بياناتك من الوصول غير المصرح به أو التعديل أو التدمير.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 390,
              height: 102,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: '٥.التحديثات\n',
                      style: TextStyle(
                        color: Color(0xFF20776B),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر، وسيتم إشعارك بأي تغييرات جوهرية من خلال البرنامج.\n',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8999999761581421),
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 390,
              height: 54,
              child: Text(
                'بهذه السياسة، نحن نسعى لضمان الحفاظ على خصوصيتك وثقتك بنا',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF20776B),
                  fontSize: 16,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
