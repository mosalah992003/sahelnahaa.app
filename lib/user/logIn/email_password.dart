import 'package:flutter/material.dart';
import 'package:sahelnahaa/user/home%20page/home_page.dart';
import 'package:sahelnahaa/user/logIn/forgetpassword.dart';

class EmailPasswordWidget extends StatefulWidget {
  const EmailPasswordWidget({super.key});

  @override
  EmailPasswordWidgetState createState() => EmailPasswordWidgetState();
}

class EmailPasswordWidgetState extends State<EmailPasswordWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define a fixed width for the TextField and Button based on the available width
        final fieldButtonWidth = constraints.maxWidth * 0.9;

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: fieldButtonWidth,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'الايميل أو رقم الهاتف',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال البريد الإلكتروني';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'يرجى إدخال بريد إلكتروني صالح';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'كلمة المرور',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Navigate to the Forget Password page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPassword(),
                                ),
                              );
                            },
                            child: const Text(
                              'نسيت كلمة المرور؟',
                              style: TextStyle(
                                color: Color(0xFFF2A941),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Noto',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width:
                            fieldButtonWidth, // Make the button the same width as the text fields
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }));
                              // Handle sign-in logic
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF2A941),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            shadowColor: Colors.black.withOpacity(0.3),
                            elevation: 8,
                          ),
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 18.0,
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
                const SizedBox(height: 10),
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

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection:
          TextDirection.rtl, // Align hint and text from right to left
      textAlign: TextAlign.right, // Ensure the input text aligns to the right
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Noto',
      ),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(.8),
          fontFamily: 'Noto',
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(.8)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(.8)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
