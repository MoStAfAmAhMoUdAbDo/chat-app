import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_string/random_string.dart';

import '../../../../core/servcies/cach_helper.dart';
import '../../../../core/servcies/firebase_firestore_fn.dart';
import '../../../../core/servcies/user_data_key.dart';
import 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(const ChatPageState.initial());

  TextEditingController messageController = TextEditingController();
  String? userName, userImage, userLastMessage, name, messageId, email;

  getTheSharedPrefData() async {
    userName = CacheHelper().getDataString(key: UsersDataKey.userNameKey);
    userImage = CacheHelper().getDataString(key: UsersDataKey.userImageKey);
    userLastMessage =
        CacheHelper().getDataString(key: UsersDataKey.userEmailKey);
    name = CacheHelper().getDataString(key: UsersDataKey.displayNameKey);
    email = CacheHelper().getDataString(key: UsersDataKey.userEmailKey);
  }

  void initState() {
    getTheSharedPrefData();
    emit(const ChatPageState.initial());
  }

  addMassege(String chatRoomId) async {
    if (messageController.text.isNotEmpty) {
      emit(const ChatPageState.loading());
      String messege = messageController.text;
      //context.read<ChatPageCubit>().sendMessage(massege);
      messageController.clear();
      Map<String, dynamic> messageInfoData = {
        "message": messege,
        "time": DateTime.now(),
        "sendBy": userName,
        "serverTime": FieldValue.serverTimestamp(),
        "read": false,
        "picture": userImage,
      };
      messageId ??= randomAlphaNumeric(10);
      await FirebaseFirestoreFunctions()
          .sendMessage(chatRoomId, messageId!, messageInfoData);

      Map<String, dynamic> lastMassageInfoMap = {
        "lastMessage": messege,
        "lastMessageSendTime": DateTime.now(),
        "time": FieldValue.serverTimestamp(),
        "lastMassageSendBy": userName,
      };

      emit(const ChatPageState.success());
    }
  }
}
