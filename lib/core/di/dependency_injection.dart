import 'package:chat_app/feature/home/logic/cubit/search_cubit.dart';
import 'package:chat_app/feature/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../feature/forgot_password/logic/cubit/forgot_password_cubit.dart';
import '../../feature/sign_in/logic/cubit/sign_in_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit());
  getIt.registerFactory<SignInCubit>(() => SignInCubit());
  getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit());
  getIt.registerFactory<SearchCubit>(() => SearchCubit());
}
