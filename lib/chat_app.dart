import 'package:chat_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/check_device.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class ChatApp extends StatelessWidget {
  final AppRouter appRouter;
  const ChatApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;
    final bool isTablet = checkDeviceIsTablet(context);
    return ScreenUtilInit(
        designSize: Size(
          isTablet ? 400 : width,
          isTablet ? 800 : height,
        ),
        minTextAdapt: true,
        child: MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
