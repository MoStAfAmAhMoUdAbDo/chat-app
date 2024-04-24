import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());

  GlobalKey<FormState> signinFormKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(const SignInState.loadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(const SignInState.successState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const SignInState.errorState(
            error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(const SignInState.errorState(
            error: 'Wrong password provided for that user.'));
      } else {
        emit(const SignInState.errorState(
            error: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SignInState.errorState(
          error: e.toString(),
        ),
      );
    }
  }
}
