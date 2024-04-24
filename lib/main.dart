import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_app.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/servcies/cach_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  setupGetIt();
  await CacheHelper().init();
  runApp(ChatApp(
    appRouter: AppRouter(),
  ));
}
