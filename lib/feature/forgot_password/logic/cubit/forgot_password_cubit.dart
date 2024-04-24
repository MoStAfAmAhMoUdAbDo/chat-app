import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(const ForgotPasswordState.initial());
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  Future<void> forgotPassword() async {
    try {
      emit(const ForgotPasswordState.loadingState());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      emit(const ForgotPasswordState.successState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const ForgotPasswordState.errorState(
            'No user found for that email.'));
      }
      emit(ForgotPasswordState.errorState(e.toString()));
    } catch (e) {
      emit(ForgotPasswordState.errorState(e.toString()));
    }
  }
}
