import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/servcies/cach_helper.dart';
import 'package:chat_app/core/servcies/user_data_key.dart';
import 'package:chat_app/core/themes/text_style.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/feature/sign_in/logic/cubit/sign_in_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/servcies/firebase_firestore_fn.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    SignInCubit authCubit = BlocProvider.of<SignInCubit>(context);
    return Form(
      key: authCubit.signinFormKey,
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
          verticalSpace(20.h),
          CustomTextFormField(
              controller: authCubit.passwordController,
              hintText: "Password",
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
          verticalSpace(30.h),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(AppStrings.forgotPassword),
          ),
          verticalSpace(50.h),
          AppTextButton(
            buttonText: AppStrings.signIn,
            onPressed: () async {
              if (authCubit.signinFormKey.currentState!.validate()) {
                await authCubit.sigInWithEmailAndPassword();
                QuerySnapshot querySnapshot = await FirebaseFirestoreFunctions()
                    .getUserByEmail(authCubit.emailController.text);
                CacheHelper().saveData(
                    key: UsersDataKey.displayNameKey,
                    value: querySnapshot.docs[0]['name']);
                CacheHelper().saveData(
                    key: UsersDataKey.userNameKey,
                    value: querySnapshot.docs[0]["user_name"]);
                CacheHelper().saveData(
                    key: UsersDataKey.userEmailKey,
                    value: querySnapshot.docs[0]["email"]);
                CacheHelper().saveData(
                    key: UsersDataKey.userImageKey,
                    value: querySnapshot.docs[0]["photo_url"]);
                CacheHelper().saveData(
                    key: UsersDataKey.userIdKey,
                    value: querySnapshot.docs[0]["id"]);
              }
            },
            textStyle: TextStyles.font18whiteSemiBold,
          ),
        ],
      ),
    );
  }
}
