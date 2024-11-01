import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subcribe/core/extensions/context_extension.dart';
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
          padding: context.horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 67.h, bottom: 24.h),
                child: const Center(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text("email".tr(), style: lightGrey13W400),
              ),
              CustomTextField(
                controller: emailController,
                validator: (val) => val!.nameValidator(val),
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
                padding: EdgeInsets.only(top: 41.h, bottom: 16.h),
                child: BlocBuilder<LoginCubit, BaseCubitState>(
                  builder: (context, state) {
                    if (state == BaseCubitState.loading) {
                      return const CustomLoadingButtonWidget();
                    }
                    return CustomElevatedButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            loginCubit.login(email: emailController.text, password: passwordController.text);
                          }
                        },
                        buttonText: 'login');
                  },
                ),
              ),
              CustomElevatedButton(
                color: AppColors.whiteColor,
                borderColor: AppColors.borderColor,
                widget: Text(
                  "dont have an account".tr(),
                  style: grey13W400,
                ),
                onTap: () {
                  AppNavigation.navigateReplacement(const SignUpScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
