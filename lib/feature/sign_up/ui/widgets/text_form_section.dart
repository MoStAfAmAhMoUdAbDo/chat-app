import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/text_style.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form.dart';
import '../../logic/cubit/sign_up_cubit.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    SignUpCubit authCubit = BlocProvider.of<SignUpCubit>(context);
    return Form(
      key: authCubit.signupFormKey,
      child: Column(
        children: [
          CustomTextFormField(
              controller: authCubit.nameController,
              hintText: AppStrings.name,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please Enter Email";
                }
              }),
          verticalSpace(20.h),
          CustomTextFormField(
              controller: authCubit.emailController,
              hintText: AppStrings.email,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please Enter Email";
                }
              }),
          verticalSpace(20.h),
          CustomTextFormField(
              controller: authCubit.passwordController,
              hintText: AppStrings.password,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please Enter Password";
                }
              }),
          verticalSpace(20.h),
          CustomTextFormField(
              controller: authCubit.confirmPasswordController,
              hintText: AppStrings.confirmPassword,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return " Please Enter Password confirmation ";
                }
              }),
          verticalSpace(50.h),
          AppTextButton(
            buttonText: AppStrings.signUp,
            onPressed: () async {
              if (authCubit.signupFormKey.currentState!.validate()) {
                if (authCubit.passwordController.text !=
                    authCubit.confirmPasswordController.text) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Password does not match")));
                  }
                } else {
                  await authCubit.signUpWithEmailAndPassword();
                }
              }
            },
            textStyle: TextStyles.font18whiteSemiBold,
          ),
          // state is SignUpState.loading()? Container():
        ],
      ),
    );
  }
}



          // BlocBuilder<SignUpCubit, SignUpState>(
          //   builder: (context, state) {
          //     return state.when(
          //       initial: () {
          //         return AppTextButton(
          //           buttonText: AppStrings.signUp,
          //           onPressed: () async {
          //             if (authCubit.signupFormKey.currentState!.validate()) {
          //               if (authCubit.passwordController.text !=
          //                   authCubit.confirmPasswordController.text) {
          //                 if (mounted) {
          //                   ScaffoldMessenger.of(context).showSnackBar(
          //                       const SnackBar(
          //                           content: Text("Password does not match")));
          //                 }
          //               } else {
          //                 await authCubit.signUpWithEmailAndPassword();
          //               }
          //             }
          //           },
          //           textStyle: TextStyles.font18whiteSemiBold,
          //         );
          //       },
          //       loading: () {
          //         return const CircularProgressIndicator();
          //       },
          //       success: () {
          //         showToast("plz check your email for verification",
          //             Colors.greenAccent);
          //         context.pushReplacementNamed(Routes.signInScreen);
          //         return const SizedBox.shrink();
          //       },
          //       error: (error) {
          //         showToast(error, Colors.redAccent);
          //         authCubit.initState();
          //         return AppTextButton(
          //           buttonText: AppStrings.signUp,
          //           onPressed: () async {
          //             if (authCubit.signupFormKey.currentState!.validate()) {
          //               if (authCubit.passwordController.text !=
          //                   authCubit.confirmPasswordController.text) {
          //                 if (mounted) {
          //                   ScaffoldMessenger.of(context).showSnackBar(
          //                       const SnackBar(
          //                           content: Text("Password does not match")));
          //                 }
          //               } else {
          //                 await authCubit.signUpWithEmailAndPassword();
          //               }
          //             }
          //           },
          //           textStyle: TextStyles.font18whiteSemiBold,
          //         );
          //       },
          //     );
          //   },
          // ),