import 'package:chat_app/core/servcies/firebase_firestore_fn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/servcies/cach_helper.dart';
import '../../../../core/servcies/user_data_key.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());
  bool search = false;
  var queryResuiltSet = [];
  var tempSearchResuilt = [];
  var totalResuilt = [];

  String? userName, userImage, userLastMessage, name, email;
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
    emit(const SearchState.initial());
  }

  Future<void> searchUser(String value) async {
    try {
      emit(const SearchState.loadingStatee());

      if (value == "" || value.isEmpty) {
        queryResuiltSet = [];
        tempSearchResuilt = [];
        totalResuilt = [];
        emit(const SearchState.initial());
      } else if (queryResuiltSet.isEmpty && value.length == 1) {
        // var capitalizeedValue =
        //     value.substring(0, 1).toUpperCase() + value.substring(1);
        emit(const SearchState.loadingStatee());
        QuerySnapshot querySnapshot =
            await FirebaseFirestoreFunctions().searchUser(value);
        for (int i = 0; i < querySnapshot.docs.length; ++i) {
          queryResuiltSet.add(querySnapshot.docs[i].data());
          totalResuilt.add(querySnapshot.docs[i].data());
        }
        emit(SearchState.successStatee(queryResuiltSet));
      } else {
        var capitalizeedValue =
            value.substring(0, 1).toUpperCase() + value.substring(1);
        emit(const SearchState.loadingStatee());
        tempSearchResuilt = [];
        for (var element in totalResuilt) {
          if (element['user_name']
              .toString()
              .toUpperCase()
              .startsWith(capitalizeedValue)) {
            tempSearchResuilt.add(element);
          }
        }
        if (tempSearchResuilt.isEmpty) {
          emit(SearchState.successStatee(tempSearchResuilt));
        } else {
          queryResuiltSet = tempSearchResuilt;
          tempSearchResuilt = [];
          emit(SearchState.successStatee(queryResuiltSet));
        }
        // queryResuiltSet = tempSearchResuilt;
        // tempSearchResuilt = [];
      }
    } on FirebaseException catch (e) {
      emit(SearchState.errorStatee(e.toString()));
    } catch (e) {
      emit(SearchState.errorStatee(e.toString()));
    }
  }

  void clearSearch() {
    emit(const SearchState.initial());
  }
}
