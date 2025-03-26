import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sahelnahaa/user/home%20page/image_picker.dart';
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
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xff207768),
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        content: Center(
          child: Text(
            'تم حفظ البيانات بنجاح',
            style: TextStyle(
                fontFamily: "noto",
                color: Colors.white,
                fontSize: 14.sp,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 2.2.h,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'البيانات الشخصية',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'noto',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              // Profile header
              Center(
                child: Column(
                  children: [
                    // Profile image with edit button
                    Stack(
                      children: [
                        const ClipOval(
                          child: PicProfileImgWidget(),
                        ),
                        Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 1.8.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    // User name
                    Text(
                      nameController.text.isNotEmpty
                          ? nameController.text
                          : 'اسم المستخدم',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              // Stats cards
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem(
                        '12', 'الخدمات', Icons.home_repair_service_outlined),
                    _buildDivider(),
                    _buildStatItem(
                        '5', 'المشتريات', IconsaxPlusLinear.shopping_cart),
                    _buildDivider(),
                    _buildStatItem('800', 'الأموال', IconsaxPlusLinear.wallet),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              // Personal Info Section
              Text(
                'المعلومات الشخصية',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 2.h),
              // Text fields
              _buildTextField(
                'الأسم كامل',
                nameController,
                IconsaxPlusLinear.profile,
              ),
              _buildTextField(
                'رقم الهاتف',
                phoneController,
                IconsaxPlusLinear.call,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                'العنوان بالتفصيل',
                addressController,
                IconsaxPlusLinear.location,
              ),
              SizedBox(height: 2.h),
              // Account Info Section
              Text(
                'معلومات الحساب',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'noto',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 2.h),
              _buildTextField(
                'البريد الإلكتروني',
                emailController,
                IconsaxPlusLinear.sms,
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(
                'كلمة المرور',
                passwordController,
                IconsaxPlusLinear.lock,
                obscureText: true,
                showSuffix: true,
              ),
              SizedBox(height: 4.h),
              // Save button
              SizedBox(
                width: double.infinity,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: _saveData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF207768),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5.h),
                    ),
                  ),
                  child: Text(
                    'حفظ التغييرات',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 6.h,
      width: 0.2.w,
      color: Colors.grey.withOpacity(0.3),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(1.2.h),
          decoration: BoxDecoration(
            color: const Color(0xFF207768).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF207768),
            size: 2.2.h,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'noto',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12.sp,
            fontFamily: 'noto',
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool obscureText = false,
    bool showSuffix = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "noto",
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
            fontFamily: "noto",
            fontSize: 13.sp,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.all(1.h),
            padding: EdgeInsets.all(1.h),
            decoration: BoxDecoration(
              color: const Color(0xFF207768).withOpacity(0.1),
              borderRadius: BorderRadius.circular(1.h),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF207768),
              size: 2.h,
            ),
          ),
          suffixIcon: showSuffix
              ? IconButton(
                  icon: Icon(
                    Icons.visibility_outlined,
                    color: Colors.grey,
                    size: 2.h,
                  ),
                  onPressed: () {
                    // Toggle password visibility
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.5.h),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.5.h),
            borderSide:
                BorderSide(color: const Color(0xff207768), width: 0.3.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.5.h),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
        ),
      ),
    );
  }
}
