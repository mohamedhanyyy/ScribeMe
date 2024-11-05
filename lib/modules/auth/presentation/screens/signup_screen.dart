import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subcribe/core/extensions/string_extenstions.dart';
import 'package:subcribe/core/resources/colors.dart';
import 'package:subcribe/core/resources/styles.dart';
import 'package:subcribe/modules/auth/presentation/screens/login_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';
import 'package:subcribe/shared/widgets/custom_divider.dart';
import 'package:subcribe/shared/widgets/custom_text_field.dart';

import '../../../../shared/widgets/custom_pawword_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String dropDownValue = '+20';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up',
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDivider(),
              SizedBox(height: 24.h),
              Text(
                "Register to get started",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Please fill all your data..",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 24.h),
              const Text("Full name", style: primary16w600),
              CustomTextField(
                hintText: 'User Name',
                controller: fullNameController,
                validator: (val) => val!.nameValidator(val),
              ),
              SizedBox(height: 16.h),
              const Text("Email address", style: primary16w600),
              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
                validator: (val) => val!.emailValidator(val),
              ),
              SizedBox(height: 16.h),
              const Text("Phone number", style: primary16w600),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: dropDownValue,
                      underline: const SizedBox.shrink(),
                      items: <String>['+20', '+1', '+44', '+91']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        );
                      }).toList(),
                      iconEnabledColor: AppColors.grey,
                      onChanged: (newValue) {
                        dropDownValue = newValue!;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      hintText: '100142258',
                      controller: phoneController,
                      validator: (val) => val!.phoneValidator(val),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Text("Password", style: primary16w600),
              CustomPasswordTextField(
                borderColor: AppColors.grey,
                hintText: 'Enter your password',
                controller: passwordController,
                validator: (val) => val!.passwordValidator(val),
              ),
              SizedBox(height: 8.h),
              const Text(
                'must include minimum 8 letters, numbers.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff888888),
                ),
              ),
              SizedBox(height: 16.h),
              const Text("Confirm password", style: primary16w600),
              CustomPasswordTextField(
                hintText: 'Confirm your password',
                controller: confirmPasswordController,
                validator: (val) =>
                    val!.confirmPasswordValidator(val, passwordController.text),
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // Sign up logic here
                  }
                },
                buttonText: 'Sign up',
                // t: Colors.white,
              ),
              SizedBox(height: 12.h),
              Center(
                child: TextButton(
                  onPressed: () {
                    AppNavigation.navigateReplacement(const LoginScreen());
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: lightGrey13W400,
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
