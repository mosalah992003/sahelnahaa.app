import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/home%20page/image_picker.dart';
import 'package:sahelnahaa/user/profile/container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      addressController.text = prefs.getString('address') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('address', addressController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xff207768),
        content: Center(
          child: Text(
            'تم حفظ البيانات بنجاح',
            style: TextStyle(
                fontFamily: "noto",
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff9f9f9),
        title: Center(
          child: Text(
            'البيانات الشخصية',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'noto',
              fontWeight: FontWeight.w600,
              height: 1.50,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 11.h),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack to position the image half inside and half outside the container
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Container for the text fields
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Material(
                      elevation: 2,
                      color: const Color(0xFF207768),
                      borderRadius: BorderRadius.circular(2.h),
                      child: Container(
                        width: double.infinity,
                        height: 16.h,
                        margin:
                            EdgeInsets.only(top: 10.h), // Space for the image
                        padding: EdgeInsets.all(2.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFF207768),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                      ),
                    ),
                  ),
                  // Image positioned half inside and half outside the container
                  Positioned(
                    top: -8.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          // Circular image
                          Container(
                            width: 14.h,
                            height: 15.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.5.w,
                              ),
                            ),
                            child: const PicProfileImgWidget(),
                          ),
                          SizedBox(height: 1.h), // Space between image and name
                          // User name
                          Text(
                            nameController.text.isNotEmpty
                                ? nameController.text
                                : 'اسم المستخدم',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'noto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            indent: 11.w,
                            endIndent: 11.w,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                profilecontainer(
                                  text: 'عدد الخدمات المتلقاه',
                                  text2: 'خدمه',
                                  text3: '12',
                                ),
                                profilecontainer(
                                  text: 'عدد المشتريات',
                                  text2: 'منتج',
                                  text3: '5',
                                ),
                                profilecontainer(
                                  text: 'الأموال المدفوعة',
                                  text2: 'جنية',
                                  text3: '800',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h), // Space for the image
              // Text fields
              _buildTextField(
                  'الأسم كامل', nameController, IconsaxPlusLinear.profile),
              _buildTextField(
                  'رقم الهاتف', phoneController, IconsaxPlusLinear.call,
                  keyboardType: TextInputType.phone),
              _buildTextField('العنوان بالتفصيل', addressController,
                  IconsaxPlusLinear.location),
              _buildTextField(
                  'البريد الإلكتروني', emailController, IconsaxPlusLinear.sms,
                  keyboardType: TextInputType.emailAddress),
              _buildTextField(
                  'كلمة المرور', passwordController, IconsaxPlusLinear.lock,
                  obscureText: true),
              SizedBox(height: 2.h),
              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF207768),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1.6.h),
                  ),
                  child: Text(
                    'حفظ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black, // Styled text color
          fontSize: 14.sp, // Adjust font size
          fontWeight: FontWeight.w600, // Bold text
          fontFamily: "noto", // Custom font
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black.withOpacity(.8),
              fontFamily: "noto",
              fontSize: 14.sp),
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
            size: 2.5.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.h),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.h),
            borderSide: BorderSide(color: const Color(0xff207768), width: .3.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.h),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.8)),
          ),
        ),
      ),
    );
  }
}
