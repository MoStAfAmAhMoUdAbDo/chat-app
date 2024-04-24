import 'package:chat_app/feature/home/logic/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/cubit/search_state.dart';
import 'chat_cell.dart';

// ignore: must_be_immutable
class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        width: MediaQuery.of(context).size.width,
        height: 676.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.when(initial: () {
              return const Column(
                children: [
                  ChatCell(
                    data: {
                      "name": "John Doe",
                      "lastMessage": "Hello World",
                    },
                  ),
                ],
              );
            }, loadingStatee: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, errorStatee: (error) {
              return Text(error);
            }, successStatee: (value) {
              return value.length == 0
                  ? const Text("No users found")
                  : ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ChatCell(
                              data: {
                                "name": value[index]["name"],
                                "lastMessage": value[index]["user_name"],
                              },
                            ),
                            verticalSpace(20.h),
                          ],
                        );
                      });
            });
          },
        ),
      ),
    );
  }
}
