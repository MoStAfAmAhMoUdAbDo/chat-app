import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_color.dart';
import '../../../../core/themes/text_style.dart';

class ReceiverMessage extends StatelessWidget {
  const ReceiverMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: ColorsManager.chatBubble,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Text(
        "whats up",
        style: TextStyles.font17Blackmedium.copyWith(fontSize: 15.sp),
      ),
    );
  }
}
