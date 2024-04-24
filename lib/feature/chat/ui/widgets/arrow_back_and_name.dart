import 'package:chat_app/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_color.dart';
import '../../../../core/themes/text_style.dart';

class ArrowBackAndName extends StatelessWidget {
  const ArrowBackAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorsManager.lighterPirple,
            ),
          ),
          horizontalSpace(100.w),
          Text(
            "Name",
            style: TextStyles.font22LighterPurpleBold,
          ),
        ],
      ),
    );
  }
}
