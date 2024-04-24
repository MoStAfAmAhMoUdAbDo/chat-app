import 'package:chat_app/core/helpers/extentions.dart';
import 'package:chat_app/feature/sign_up/ui/widgets/signup_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import 'widgets/already_have_account.dart';
import 'widgets/logo_signUp_background.dart';
import 'widgets/logo_signup_text.dart';
import 'widgets/new_account_text.dart';
import 'widgets/text_form_section.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const LogoSignUpBackground(),
              Padding(
                padding: EdgeInsets.only(top: 80.0.h),
                child: Column(
                  children: [
                    const LogoSignUpText(),
                    const CreateNewAccount(),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          height: 450.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SignUpFormSection(),
                        ),
                      ),
                    ),
                    const SginUpBlocListener(),
                    GestureDetector(
                        onTap: () {
                          context.pushReplacementNamed(Routes.signInScreen);
                        },
                        child: const AlreadyHaveAccountText()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
