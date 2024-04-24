import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/email_forgot.dart';
import 'widgets/forgot_password_accout_text.dart';
import 'widgets/logo_background_forgot.dart';
import 'widgets/logo_forgot_accout.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const LogoBackgroundForgotPassword(),
              Padding(
                padding: EdgeInsets.only(top: 80.0.h),
                child: Column(
                  children: [
                    const ForgotpasswordRecoveryText(),
                    const LogoForgotAcount(),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          height: 250.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const EmailAndPassword(),
                        ),
                      ),
                    ),
                    //const SignInBlocListener(),
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
