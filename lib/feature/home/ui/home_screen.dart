import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/chat_section.dart';
import 'widgets/header_and_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.pirple,
      body: Column(
        children: [
          const HeaderAndSearch(),
          verticalSpace(20.h),
          const ChatSection(),
        ],
      ),
    );
  }
}
