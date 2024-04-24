import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreFunctions {
  Future addUserDetails(
      {required String id, required Map<String, dynamic> userInfoData}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoData);
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  Future<QuerySnapshot> searchUser(String userName) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("searchKey", isEqualTo: userName.substring(0, 1).toUpperCase())
        .get();
  }

  createChatRoom(
      String chatRoomId, Map<String, dynamic> chatRoomInfoMap) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .get();
    if (snapshot.exists) {
      return true;
    } else {
      return FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  Future<QuerySnapshot> getChatRoom(String userName) async {
    return await FirebaseFirestore.instance.collection("chatRoom").get();
  }

  Future sendMessage(String chatRoomId, String messageId,
      Map<String, dynamic> messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(messageInfoMap);
  }
}
