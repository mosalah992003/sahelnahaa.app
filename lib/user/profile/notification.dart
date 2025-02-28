import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List<bool> _switchValues;
  final List<Map<String, String>> notifications = [
    {'title': 'السماح بالإشعارات', 'subtitle': 'تم إضافة إشعار جديد'},
    {'title': 'إرسال إشعار خاص بالموعد', 'subtitle': 'هناك تحديث جديد متوفر'},
    {'title': 'إرسال إشعار خاص بالسوق', 'subtitle': 'لا تفوت العروض الحصرية'},
    {
      'title': 'إرسال إشعار خاص بالعروض',
      'subtitle': 'يرجى مراجعة إعدادات الأمان'
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadSwitchValues();
  }

  Future<void> _loadSwitchValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _switchValues = List.generate(
        notifications.length,
        (index) => prefs.getBool('switch_$index') ?? true,
      );
    });
  }

  Future<void> _saveSwitchValue(int index, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('switch_$index', value);
    setState(() {
      _switchValues[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        title: Center(
          child: Text(
            'التنبيهات',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF1B2431),
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: Column(
          children: List.generate(notifications.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(
                    value: _switchValues[index],
                    activeColor:
                        // ignore: use_full_hex_values_for_flutter_colors
                        const Color(
                            // ignore: use_full_hex_values_for_flutter_colors
                            0xff2077068), // Active switch color set to green
                    onChanged: (bool value) {
                      _saveSwitchValue(index, value);
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          notifications[index]['title']!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "noto",
                          ),
                        ),
                        Text(
                          notifications[index]['subtitle']!,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                            fontFamily: "noto",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
