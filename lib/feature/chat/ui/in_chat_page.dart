import 'package:chat_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import 'widgets/arrow_back_and_name.dart';
import 'widgets/chat_section_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, this.name, this.userName, this.chatRoomId});
  final String? name, userName, chatRoomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.pirple,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: 30.h,
          ),
          child: Column(
            children: [
              const ArrowBackAndName(),
              verticalSpace(20.h),
              ChatSectionView(
                chatRoomId: chatRoomId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
