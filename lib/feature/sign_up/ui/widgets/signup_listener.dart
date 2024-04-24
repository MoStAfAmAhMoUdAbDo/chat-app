import 'package:chat_app/core/helpers/extentions.dart';
import 'package:chat_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/error_daialog.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import '../../logic/cubit/sign_up_state.dart';

class SginUpBlocListener extends StatelessWidget {
  const SginUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
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
          success: () {
            context.pop();
            context.pushNamed(Routes.signInScreen);
          },
          error: (error) {
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
