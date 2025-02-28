// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Credit extends StatefulWidget {
  const Credit({super.key});

  @override
  _CreditState createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  double _currentPage = 0.0;
  List<CreditCardInfo> _creditCards = [];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    _loadCreditCards(); // Load saved credit cards from SharedPreferences
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadCreditCards() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedCards = prefs.getStringList('credit_cards');
    if (savedCards != null) {
      setState(() {
        _creditCards = savedCards.map((cardJson) {
          final Map<String, dynamic> cardMap =
              Map<String, dynamic>.from(jsonDecode(cardJson));
          return CreditCardInfo(
            cardNumber: cardMap['cardNumber'],
            expiryDate: cardMap['expiryDate'],
            cardHolderName: cardMap['cardHolderName'],
            cvvCode: cardMap['cvvCode'],
          );
        }).toList();
      });
    }
  }

  Future<void> _saveCreditCards() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cardJsonList = _creditCards.map((card) {
      return jsonEncode({
        'cardNumber': card.cardNumber,
        'expiryDate': card.expiryDate,
        'cardHolderName': card.cardHolderName,
        'cvvCode': card.cvvCode,
      });
    }).toList();
    await prefs.setStringList('credit_cards', cardJsonList);
  }

  void _showAddCardDialog(BuildContext context) {
    String cardNumber = '';
    String cardHolderName = '';
    String expiryDate = '';
    String cvvCode = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'إضافة بطاقة جديدة',
              style: TextStyle(
                fontFamily: "noto",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStyledTextField('رقم البطاقة',
                    onChanged: (value) => cardNumber = value),
                SizedBox(height: 1.4.h),
                _buildStyledTextField('اسم حامل البطاقة',
                    onChanged: (value) => cardHolderName = value),
                SizedBox(height: 1.4.h),
                Row(
                  children: [
                    Expanded(
                        child: _buildStyledTextField('السنة',
                            onChanged: (value) => expiryDate = value)),
                    SizedBox(width: 3.w),
                    Expanded(
                        child: _buildStyledTextField('الشهر',
                            onChanged: (value) => expiryDate = value)),
                    SizedBox(width: 3.w),
                    Expanded(
                        child: _buildStyledTextField('CVV',
                            onChanged: (value) => cvvCode = value)),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.h),
                      color: const Color(0xff20776b),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (cardNumber.isNotEmpty &&
                            cardHolderName.isNotEmpty &&
                            expiryDate.isNotEmpty &&
                            cvvCode.isNotEmpty) {
                          setState(() {
                            _creditCards.add(CreditCardInfo(
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode,
                            ));
                          });
                          _saveCreditCards(); // Save the updated list
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('يرجى ملء جميع الحقول')),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'إضافة',
                          style: TextStyle(
                            fontFamily: "noto",
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Container(
                    width: 20.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.h),
                      color: Colors.red.shade700,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Center(
                        child: Text(
                          'إلغاء',
                          style: TextStyle(
                            fontFamily: "noto",
                            fontSize: 15.sp,
                            color: Colors.white,
                          ),
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

  Widget _buildStyledTextField(String hintText,
      {ValueChanged<String>? onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "noto",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF979797),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.h),
          borderSide: const BorderSide(color: Color(0xff207768), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.h),
          borderSide: const BorderSide(color: Color(0xff207768), width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      ),
    );
  }

  void _removeCreditCard(int index) {
    setState(() {
      _creditCards.removeAt(index);
    });
    _saveCreditCards(); // Save the updated list after removal
  }

  void _showRemoveConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            'هل تريد حذف هذه البطاقة؟',
            style: TextStyle(
              fontFamily: "noto",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                'إلغاء',
                style: TextStyle(
                  fontFamily: "noto",
                  fontSize: 15.sp,
                  color: Colors.red.shade700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _removeCreditCard(index); // Remove the card
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                'حذف',
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 26.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _creditCards.length,
            itemBuilder: (context, index) {
              final card = _creditCards[index];
              double scale = (index == _currentPage.floor()) ? 1.0 : 0.93;

              return GestureDetector(
                onLongPress: () =>
                    _showRemoveConfirmationDialog(context, index),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: scale,
                  child: CreditCardWidget(
                    cardNumber: card.cardNumber,
                    expiryDate: card.expiryDate,
                    cardHolderName: card.cardHolderName,
                    cvvCode: card.cvvCode,
                    showBackView: false,
                    onCreditCardWidgetChange: (CreditCardBrand brand) {},
                    cardBgColor: const Color(0xFF207768), // Updated color here
                  ),
                ),
              );
            },
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Text(
                'أضافه طريقه اخرى ',
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
                onTap: () => _showAddCardDialog(context),
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
      ],
    );
  }
}

class CreditCardInfo {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  const CreditCardInfo({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });
}
