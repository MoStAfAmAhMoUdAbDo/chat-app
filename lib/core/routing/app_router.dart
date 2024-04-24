import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/feature/chat/ui/in_chat_page.dart';
import 'package:chat_app/feature/forgot_password/ui/forgot_password_screen.dart';
import 'package:chat_app/feature/home/ui/home_screen.dart';
import 'package:chat_app/feature/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/forgot_password/logic/cubit/forgot_password_cubit.dart';
import '../../feature/home/logic/cubit/search_cubit.dart';
import '../../feature/sign_in/logic/cubit/sign_in_cubit.dart';
import '../../feature/sign_in/ui/sign_in.dart';
import '../../feature/sign_up/ui/sign_up.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignInCubit>(),
            child: const SignIn(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUp(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SearchCubit>(),
                  child: const HomeScreen(),
                ));
      case Routes.chatScreen:
        final chatArguments = arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  name: chatArguments["name"],
                  //userImage: chatArguments["userImage"],
                  userName: chatArguments["userName"],
                  chatRoomId: chatArguments["chatRoomId"],
                ));
      // "name": data["name"],
      // "userName": data["user_name"],
      // "userImage": data["photo_url"],
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ForgotPasswordCubit>(),
                  child: const ForgotPasswordScreen(),
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
