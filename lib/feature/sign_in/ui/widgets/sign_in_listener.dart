import 'package:chat_app/core/helpers/extentions.dart';
import 'package:chat_app/feature/sign_in/logic/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_color.dart';
import '../../../../core/widgets/error_daialog.dart';
import '../../logic/cubit/sign_in_state.dart';

class SignInBlocListener extends StatelessWidget {
  const SignInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is LoadingState ||
          current is SuccessState ||
          current is ErrorState,
      listener: (context, state) {
        state.whenOrNull(
          loadingState: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          successState: () {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          errorState: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                content: error,
                context: context,
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
