import 'package:chat_app/models/services/database_service.dart';
import 'package:chat_app/models/user/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatProvider with ChangeNotifier {
  late List<ChatModel> _allChats = [];
  List<ChatModel> get allChats => _allChats;
  bool isMe = true;
  String? _senderEmail;
  String? _receiverEmail;

  String get senderEmail => _senderEmail ?? "";
  String get receiverEmail => _receiverEmail ?? "";
  set senderEmail(String senderEmail) {
    _senderEmail = senderEmail;
  }

  set receiverEmail(String receiverEmail) {
    _receiverEmail = receiverEmail;
  }

  // // image picker
  // String? _image;
  // Future getImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;

  //   final imageTemporary = image.path;

  //   _image = imageTemporary;
  // }

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
  Future<List<Map<String, dynamic>>> getChatMessage() {
    return DatabaseService.instance.getMessage(senderEmail, receiverEmail);
  }

  // // get singel chat model
  // Future<List<Map<String, dynamic>>> getSingleChatModelFromEmail(String email) {
  //   return DatabaseService.instance.getSingleChatModel(email);
  // }

  //  change user or swap button
  void ChangeUser() {
    isMe = !isMe;
    notifyListeners();
  }
}
