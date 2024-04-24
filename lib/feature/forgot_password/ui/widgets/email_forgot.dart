import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/text_style.dart';
import 'package:chat_app/feature/forgot_password/logic/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    ForgotPasswordCubit authCubit =
        BlocProvider.of<ForgotPasswordCubit>(context);
    return Form(
      key: authCubit.forgotPasswordFormKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: authCubit.emailController,
              hintText: "Email",
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please Enter Email";
                }
              }),
          verticalSpace(50.h),
          AppTextButton(
            buttonText: "Send Email",
            onPressed: () async {
              if (authCubit.forgotPasswordFormKey.currentState!.validate()) {
                await authCubit.forgotPassword();
              }
            },
            textStyle: TextStyles.font18whiteSemiBold,
          ),
        ],
      ),
    );
  }
}
