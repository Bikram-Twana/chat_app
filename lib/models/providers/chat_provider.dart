import 'package:chat_app/models/services/database_service.dart';
import 'package:chat_app/models/user/chat_model.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  late List<ChatModel> _allChats = [];
  List<ChatModel> get allChats => _allChats;

  getChats() async {
    await DatabaseService.instance.getAllChatModels().then((value) {
      _allChats = value;
      notifyListeners();
    });
  }

  // send message or add message
  void sendMessage(ChatModel chatModel) {
    DatabaseService.instance.addMessage(chatModel);
    getChats();
  }

  // get message or chat between logged user and other user
  Future<List<Map<String, dynamic>>> getChatMessage(
      String loggedUserID, String otherUserID) {
    return DatabaseService.instance.getMessage(loggedUserID, otherUserID);
  }

  // get singel chat model
  Future<List<Map<String, dynamic>>> getSingleChatModelFromEmail(String email) {
    return DatabaseService.instance.getSingleChatModel(email);
  }
}
