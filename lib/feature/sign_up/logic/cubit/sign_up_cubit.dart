import 'package:chat_app/core/servcies/cach_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_string/random_string.dart';
import '../../../../core/servcies/firebase_firestore_fn.dart';
import '../../../../core/servcies/user_data_key.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());
  GlobalKey<FormState> signupFormKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(const SignUpState.loading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await addUserProfile();
      await verifyEmail();
      emit(const SignUpState.success());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignUpState.error(error: e.toString()));
    }
  }

  void initState() {
    emit(const SignUpState.initial());
  }

  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(
          const SignUpState.error(error: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(const SignUpState.error(
          error: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(const SignUpState.error(error: 'The email is invalid.'));
    } else {
      emit(SignUpState.error(error: e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> addUserProfile() async {
    String id = randomAlphaNumeric(10);
    String user = emailController.text.replaceAll("@gmail.com", "");
    String updateUserName = user.replaceFirst(user[0], user[0].toUpperCase());
    String userFirstLetter = user.substring(0, 1).toUpperCase();
    Map<String, dynamic> userInfoData = {
      "name": nameController.text,
      "email": emailController.text,
      "user_name": updateUserName,
      "searchKey": userFirstLetter,
      "photo_url":
          "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn-icons-png.flaticon.com%2F512%2F5556%2F5556499.png&tbnid=975KtNzr2py6fM&vet=10CAIQxiAoAGoXChMI4LmFk7XShQMVAAAAAB0AAAAAEAc..i&imgrefurl=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fman-avatar_5556499&docid=8N6L-rEV2a0SnM&w=512&h=512&itg=1&q=man%20avatar%20image&ved=0CAIQxiAoAGoXChMI4LmFk7XShQMVAAAAAB0AAAAAEAc",
      "id": id
    };

    await FirebaseFirestoreFunctions().addUserDetails(
      id: id,
      userInfoData: userInfoData,
    );

    await CacheHelper().saveData(key: UsersDataKey.userIdKey, value: id);
    await CacheHelper()
        .saveData(key: UsersDataKey.userEmailKey, value: emailController.text);
    await CacheHelper().saveData(
        key: UsersDataKey.userImageKey,
        value:
            "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn-icons-png.flaticon.com%2F512%2F5556%2F5556499.png&tbnid=975KtNzr2py6fM&vet=10CAIQxiAoAGoXChMI4LmFk7XShQMVAAAAAB0AAAAAEAc..i&imgrefurl=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fman-avatar_5556499&docid=8N6L-rEV2a0SnM&w=512&h=512&itg=1&q=man%20avatar%20image&ved=0CAIQxiAoAGoXChMI4LmFk7XShQMVAAAAAB0AAAAAEAc");
    await CacheHelper()
        .saveData(key: UsersDataKey.displayNameKey, value: nameController.text);

    await CacheHelper().saveData(
        key: UsersDataKey.userNameKey,
        value: emailController.text.replaceAll("@gmail.com", ""));
  }
}
