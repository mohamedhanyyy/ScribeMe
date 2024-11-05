import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subcribe/core/extensions/string_extenstions.dart';
import 'package:subcribe/core/resources/colors.dart';
import 'package:subcribe/core/resources/styles.dart';
import 'package:subcribe/modules/auth/cubit/login_cubit.dart';
import 'package:subcribe/modules/auth/presentation/screens/signup_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';
import 'package:subcribe/shared/widgets/custom_loading_widget.dart';
import 'package:subcribe/shared/widgets/custom_text_field.dart';

import '../../../../core/cubit/base_cubit_state.dart';
import '../../../../shared/widgets/custom_pawword_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit loginCubit;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginCubit = context.read<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Center(child: Image.asset('assets/images/doc.png')),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  "Welcome,\nGlad to see you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  "Please log in to continue",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text("Email address", style: primary16w600),
              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
                validator: (val) => val!.nameValidator(val),
              ),
              SizedBox(height: 16.h),
              const Text("Password", style: primary16w600),
              CustomPasswordTextField(
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
                    color: Color(0xff888888)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              BlocBuilder<LoginCubit, BaseCubitState>(
                builder: (context, state) {
                  if (state == BaseCubitState.loading) {
                    return const CustomLoadingButtonWidget();
                  }
                  return CustomElevatedButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        loginCubit.login(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    buttonText: 'Log in',
                    color: AppColors.secondaryColor,

                    // : Colors.white,
                  );
                },
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  const Expanded(
                      child: Divider(thickness: 1, color: AppColors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const Text("Or with", style: grey13W400),
                  ),
                  const Expanded(
                      child: Divider(thickness: 1, color: AppColors.grey)),
                ],
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/google.svg'),
                  label: const Text("Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.white,
                    side: const BorderSide(color: AppColors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: TextButton(
                  onPressed: () {
                    AppNavigation.navigateReplacement(const SignUpScreen());
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "No account yet? ",
                      style: lightGrey13W400,
                      children: [
                        TextSpan(
                          text: "Signup",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
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
