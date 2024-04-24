import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/cubit/chat_page_cubit.dart';
import 'receiver_message.dart';
import 'sender_message.dart';

class ChatSectionView extends StatefulWidget {
  const ChatSectionView({super.key, this.chatRoomId});
  final String? chatRoomId;

  @override
  State<ChatSectionView> createState() => _ChatSectionViewState();
}

class _ChatSectionViewState extends State<ChatSectionView> {
  // addMassege() {
  //   if (context.read<ChatPageCubit>().messageController.text.isNotEmpty) {
  //     String messege = context.read<ChatPageCubit>().messageController.text;
  //     //context.read<ChatPageCubit>().sendMessage(massege);
  //     context.read<ChatPageCubit>().messageController.clear();
  //     Map<String, dynamic> messageInfoData = {
  //       "message": messege,
  //       "time": DateTime.now(),
  //       "sendBy": context.read<ChatPageCubit>().userName,
  //       "serverTime": FieldValue.serverTimestamp(),
  //       "read": false,
  //       "picture": context.read<ChatPageCubit>().userImage,
  //     };
  //     if (context.read<ChatPageCubit>().messageId == "") {
  //       context.read<ChatPageCubit>().messageId = randomAlphaNumeric(10);
  //     }
  //   }
  // }

  @override
  void initState() {
    context.read<ChatPageCubit>().initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            EdgeInsets.only(top: 40.w, left: 20.w, right: 20.w, bottom: 15.h),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.14,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SenderMessage(),
            verticalSpace(20.h),
            const ReceiverMessage(),
            const Spacer(),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller:
                          context.read<ChatPageCubit>().messageController,
                      hintText: AppStrings.typeMessage,
                      hintStyle: const TextStyle(color: Colors.grey),
                      validator: (value) {},
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
