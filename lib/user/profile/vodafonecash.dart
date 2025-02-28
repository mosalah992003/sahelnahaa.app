import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/repair/widget/customCheckBox.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class VodafoneCash extends StatefulWidget {
  const VodafoneCash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VodafoneCashState createState() => _VodafoneCashState();
}

class _VodafoneCashState extends State<VodafoneCash> {
  List<Map<String, String>> wallets = [];

  @override
  void initState() {
    super.initState();
    _loadWallets();
  }

  Future<void> _loadWallets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? walletsString = prefs.getString('wallets');
    if (walletsString != null) {
      setState(() {
        wallets = List<Map<String, String>>.from(
          json
              .decode(walletsString)
              .map((item) => Map<String, String>.from(item)),
        );
      });
    }
  }

  Future<void> _saveWallets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('wallets', json.encode(wallets));
  }

  void _addWallet(String number, String name) {
    setState(() {
      wallets.add({'number': number, 'name': name});
    });
    _saveWallets();
  }

  void _removeWallet(int index) {
    setState(() {
      wallets.removeAt(index);
    });
    _saveWallets();
  }

  void _showRemoveConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            "هل تريد حذف هذه المحفظة؟",
            style: TextStyle(
              fontFamily: "noto",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Cancel deletion
              child: Text(
                "إلغاء",
                style: TextStyle(
                  fontFamily: "noto",
                  fontSize: 15.sp,
                  color: Colors.red.shade700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _removeWallet(index); // Remove the wallet
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                "حذف",
                style: TextStyle(
                  fontFamily: "noto",
                  fontSize: 15.sp,
                  color: Colors.green.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddWalletDialog(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.h),
            ),
            title: Text(
              "إضافة محفظة جديدة",
              style: TextStyle(
                fontFamily: "noto",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    labelText: "رقم المحفظة",
                    labelStyle: TextStyle(
                      fontFamily: "noto",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF979797),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "اسم المحفظة",
                    labelStyle: TextStyle(
                      fontFamily: "noto",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF979797),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff20776b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                      ),
                      onPressed: () {
                        String number = numberController.text.trim();
                        String name = nameController.text.trim();
                        if (number.isNotEmpty && name.isNotEmpty) {
                          _addWallet(number, name);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "إضافة",
                        style: TextStyle(
                          fontFamily: "noto",
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "إلغاء",
                        style: TextStyle(
                          fontFamily: "noto",
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      borderRadius: BorderRadius.circular(2.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              // Existing Wallets
              Column(
                children: wallets.asMap().entries.map((entry) {
                  final index = entry.key;
                  final wallet = entry.value;

                  return GestureDetector(
                    onLongPress: () => _showRemoveConfirmationDialog(
                        context, index), // Long press to remove
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomCheckbox(),
                          SizedBox(width: 3.w),
                          Row(
                            children: [
                              Text(
                                wallet['number']!,
                                style: TextStyle(
                                  color: const Color(0xFF606060),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "noto",
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                wallet['name']!,
                                style: TextStyle(
                                  color: const Color(0xFF606060),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "noto",
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Image.asset(
                                'assets/images/image 5.png',
                                width: 6.w,
                                height: 3.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 1.h),
              // Add Wallet Button
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Text(
                      'أضافه محفظة اخرى ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF606060),
                        fontSize: 14.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    GestureDetector(
                      onTap: () => _showAddWalletDialog(context),
                      child: Container(
                        width: 5.5.w,
                        height: 2.5.h,
                        decoration: ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 2.5.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
