import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/logIn/forgetpassword.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class EmailPasswordWidget extends StatefulWidget {
  const EmailPasswordWidget({super.key});

  @override
  EmailPasswordWidgetState createState() => EmailPasswordWidgetState();
}

class EmailPasswordWidgetState extends State<EmailPasswordWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fieldButtonWidth = constraints.maxWidth * 0.9;

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: fieldButtonWidth,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'الايميل أو رقم الهاتف',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال البريد الإلكتروني أو رقم الهاتف';
                          }
                          if (value.contains('@')) {
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'يرجى إدخال بريد إلكتروني صالح';
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 1.5.h),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'كلمة المرور',
                        obscureText: _isObscure,
                        prefixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? IconsaxPlusLinear.eye
                                : IconsaxPlusLinear.eye_slash,
                            color: Colors.black.withOpacity(0.6),
                            size: 2.5.h,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure; // Toggle visibility
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: .5.h),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'نسيت كلمة المرور؟',
                              style: TextStyle(
                                  color: const Color(0xFFF2A941),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Noto',
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFFF2A941)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 6.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF2A941),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            shadowColor: Colors.black.withOpacity(0.3),
                            elevation: 8,
                          ),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Noto',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon; // Moved icon to left

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.prefixIcon, // Added
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Noto',
        fontSize: 15.sp,
        fontWeight: FontWeight.w300,
      ),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.7.h),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(.8),
          fontFamily: 'Noto',
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(.8)),
          borderRadius: BorderRadius.circular(1.h),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(.8)),
          borderRadius: BorderRadius.circular(1.h),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon, // Moved icon to left
      ),
    );
  }
}
