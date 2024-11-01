import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subcribe/core/extensions/context_extension.dart';
import 'package:subcribe/core/extensions/string_extenstions.dart';
import 'package:subcribe/core/resources/colors.dart';
import 'package:subcribe/core/resources/images.dart';
import 'package:subcribe/core/resources/styles.dart';
import 'package:subcribe/modules/auth/cubit/login_cubit.dart';
import 'package:subcribe/modules/auth/cubit/sign_up_cubit.dart';
import 'package:subcribe/modules/auth/presentation/screens/login_screen.dart';
import 'package:subcribe/services/navigation/navigation.dart';
import 'package:subcribe/shared/widgets/custom_button.dart';
import 'package:subcribe/shared/widgets/custom_loading_widget.dart';
import 'package:subcribe/shared/widgets/custom_text_field.dart';

import '../../../../core/cubit/base_cubit_state.dart';
import '../../../../shared/widgets/custom_pawword_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final phoneController = TextEditingController();
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    super.initState();
    signUpCubit = context.read<SignUpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: context.horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 67.h, bottom: 24.h),
                child: Center(
                    child: Image.asset(AppImages.appLogo,
                        width: 153.w, height: 90.h)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text("full name".tr(), style: lightGrey13W400),
              ),
              CustomTextField(
                controller: nameController,
                validator: (val) => val!.nameValidator(val),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 16),
                child: Text("email".tr(), style: lightGrey13W400),
              ),
              CustomTextField(
                controller: emailController,
                validator: (val) => val!.emailValidator(val),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 16),
                child: Text("phone number".tr(), style: lightGrey13W400),
              ),
              CustomTextField(
                controller: phoneController,
                validator: (val) => val!.phoneValidator(val),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 4),
                child: Text("password".tr(), style: lightGrey13W400),
              ),
              CustomPasswordTextField(
                controller: passwordController,
                validator: (val) => val!.passwordValidator(val),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 4),
                child: Text("confirm password".tr(), style: lightGrey13W400),
              ),
              CustomPasswordTextField(
                controller: confirmPasswordController,
                validator: (val) =>
                    val!.confirmPasswordValidator(val, passwordController.text),
              ),
              Padding(
                padding: EdgeInsets.only(top: 41.h, bottom: 16.h),
                child: BlocBuilder<LoginCubit, BaseCubitState>(
                  builder: (context, state) {
                    if (state == BaseCubitState.loading) {
                      return const CustomLoadingButtonWidget();
                    }
                    return CustomElevatedButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            signUpCubit.signUp(
                              phone: phoneController.text,
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        buttonText: 'sign up');
                  },
                ),
              ),
              CustomElevatedButton(
                color: AppColors.whiteColor,
                borderColor: AppColors.borderColor,
                widget: Text(
                  "already have account".tr(),
                  style: grey13W400,
                ),
                onTap: () {
                  AppNavigation.navigateReplacement(const LoginScreen());
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
