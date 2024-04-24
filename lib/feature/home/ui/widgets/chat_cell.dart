import 'package:chat_app/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/servcies/firebase_firestore_fn.dart';
import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/app_assets.dart';
import '../../logic/cubit/search_cubit.dart';

class ChatCell extends StatelessWidget {
  const ChatCell({super.key, required this.data});
  final Map<String, dynamic> data;
  getChatRomIdByUserName(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b}_$a";
    } else {
      return "${a}_$b";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var chatRoomId = getChatRomIdByUserName(
            context.read<SearchCubit>().userName!, data["name"]);
        Map<String, dynamic> chatRoomInfoMap = {
          "usersChat": [context.read<SearchCubit>().userName!, data["name"]],
        };

        await FirebaseFirestoreFunctions()
            .createChatRoom(chatRoomId, chatRoomInfoMap);

        context.pushNamed(Routes.chatScreen, arguments: {
          "name": data["name"],
          "userName": data["lastMessage"],
          "chatRoomId": chatRoomId,
          //"userImage": data["photo_url"],
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60.r),
            child: Image.asset(
              Assets.imagesManAvatar,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10.h),
              Text(
                data["name"],
                style: TextStyles.font17Blackmedium,
              ),
              verticalSpace(5.h),
              Text(
                data["lastMessage"],
                style: TextStyles.font17Blackmedium
                    .copyWith(color: Colors.black45, fontSize: 15),
              )
            ],
          ),
          const Spacer(),
          Text(
            "3:45 pm",
            style: TextStyles.font17Blackmedium
                .copyWith(color: Colors.black45, fontSize: 14),
          )
        ],
      ),
    );
  }
}
