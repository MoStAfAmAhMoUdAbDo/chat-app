import 'package:chat_app/core/widgets/custom_text_form.dart';
import 'package:chat_app/feature/home/logic/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_color.dart';
import '../../../../core/themes/text_style.dart';

class HeaderAndSearch extends StatefulWidget {
  const HeaderAndSearch({super.key});

  @override
  State<HeaderAndSearch> createState() => _HeaderAndSearchState();
}

class _HeaderAndSearchState extends State<HeaderAndSearch> {
  // initialeSearch(String userName) {
  //   if (userName == "" || userName.isEmpty) {
  //     queryResuiltSet = [];
  //     tempSearchResuilt = [];
  //     setState(() {});
  //   }
  //   BlocProvider.of<SearchCubit>(context).search = true;
  //   setState(() {});
  //   var capitalizeedValue =
  //       userName.substring(0, 1).toUpperCase() + userName.substring(1);
  //   if (queryResuiltSet.isEmpty && userName.length == 1) {
  //     FirebaseFirestoreFunctions()
  //         .searchUser(userName)
  //         .then((QuerySnapshot querySnapshot) {
  //       for (int i = 0; i < querySnapshot.docs.length; ++i) {
  //         queryResuiltSet.add(querySnapshot.docs[i].data());
  //       }
  //     });
  //   } else {
  //     tempSearchResuilt = [];
  //     for (var element in queryResuiltSet) {
  //       if (element['user_name'].toString().startsWith(capitalizeedValue)) {
  //         tempSearchResuilt.add(element);
  //         setState(() {});
  //       }
  //     }
  //     // queryResuiltSet = tempSearchResuilt;
  //     // tempSearchResuilt = [];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0.h, left: 20.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocProvider.of<SearchCubit>(context).search
              ? Expanded(
                  child: SizedBox(
                  height: 40.h,
                  child: CustomTextFormField(
                    onChanged: (value) {
                      BlocProvider.of<SearchCubit>(context)
                          .searchUser(value.toUpperCase());
                      //initialeSearch(value.toUpperCase());
                    },
                    hintText: "Search for users",
                    hintStyle: const TextStyle(color: Colors.grey),
                    validator: (val) {},
                  ),
                ))
              : Text(
                  "Chat Up",
                  style: TextStyles.font22LighterPurpleBold,
                ),
          horizontalSpace(20.w),
          GestureDetector(
            onTap: () {
              BlocProvider.of<SearchCubit>(context).search =
                  !BlocProvider.of<SearchCubit>(context).search;
              BlocProvider.of<SearchCubit>(context).clearSearch();

              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: ColorsManager.deepPirple,
                  borderRadius: BorderRadius.circular(20)),
              child: BlocProvider.of<SearchCubit>(context).search
                  ? const Icon(
                      Icons.close,
                      color: ColorsManager.lighterPirple,
                    )
                  : const Icon(
                      Icons.search,
                      color: ColorsManager.lighterPirple,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
