import 'package:chat_app/core/helpers/extentions.dart';

import 'package:chat_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/donot_have_account.dart';
import 'widgets/email_and_password.dart';
import 'widgets/logo_background.dart';
import 'widgets/login_accout_text.dart';
import 'widgets/logo_signin_text.dart';
import 'widgets/sign_in_listener.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const LogoBackground(),
              Padding(
                padding: EdgeInsets.only(top: 80.0.h),
                child: Column(
                  children: [
                    const LogoSignInText(),
                    const LogoLoginAcount(),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          height: 350.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const EmailAndPassword(),
                        ),
                      ),
                    ),
                    const SignInBlocListener(),
                    GestureDetector(
                        onTap: () {
                          context.pushReplacementNamed(Routes.signUpScreen);
                        },
                        child: const DontHaveAccount()),
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
