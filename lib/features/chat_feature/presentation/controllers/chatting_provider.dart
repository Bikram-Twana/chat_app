import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_chat_app/features/chat_feature/domain/models/chat_model.dart';
import 'package:new_chat_app/localization/database_service.dart';

class ChattingProvider with ChangeNotifier {
  // late List<ChatModel> _allChats = [];
  // List<ChatModel> get allChats => _allChats;
  bool isMe = true;
  String? _senderEmail;
  String? _receiverEmail;
  TextEditingController messageController = TextEditingController();

  String get senderEmail => _senderEmail ?? "";
  String get receiverEmail => _receiverEmail ?? "";
  set senderEmail(String senderEmail) {
    _senderEmail = senderEmail;
  }

  set receiverEmail(String receiverEmail) {
    _receiverEmail = receiverEmail;
  }

  // getChats() async {
  //   await DatabaseService.instance.getAllChatModels().then((value) {
  //     _allChats = value;
  //     notifyListeners();
  //   });
  // }

  // get message or chat between logged user and other user
  Future<List<Map<String, dynamic>>>? allChatMessages;
  Future<List<Map<String, dynamic>>> getChatMessage() {
    allChatMessages =
        DatabaseService.instance.getMessage(senderEmail, receiverEmail);

    return allChatMessages!;
  }

  //  change user or swap button
  void ChangeUser() {
    isMe = !isMe;
    notifyListeners();
  }

  // image picker
  String? image;
  Future<String> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return "";

    final imageTemporary = image.path;
    this.image = imageTemporary;
    return imageTemporary.toString();
  }

  // clear selected image
  void clearSelectedImage() {
    this.image = null;
  }

  // calling upper send message
  void sendMessage(String loggedUserEmail, String anotherUserEmail,
      [String message = "", String? image]) async {
    // if (message.isNotEmpty) {
    // log(anotherUserEmail);
    ChatModel chatModel = ChatModel(
        senderEmail: loggedUserEmail,
        receiverEmail: anotherUserEmail,
        message: message,
        imageMessage: image,
        datetime: DateTime.now().toIso8601String());
    DatabaseService.instance.addMessage(chatModel);
    // Provider.of<ChatProvider>(context, listen: false).addMessage(chatModel);
    // clear the text controller after sending the message
    messageController.clear();
    clearSelectedImage();
  }
  // int? _senderId;
  // int? _receiverId;
  // get senderId => _senderId;
  // get receiverId => _receiverId;
  // setSenderId(int id) {
  //   _senderId = id;
  // }

  // setReceiverId(int id) {
  //   _receiverId = id;
  // }

  // TextEditingController messageController = TextEditingController();

  // List<Map<String, dynamic>> singelUserModel = [];

  // // Check isMe, whether the message sending user is loggedUser or anotherUser
  // bool _isMe = true;
  // bool get isMe => _isMe;
  // set isMe(bool newValue) {
  //   _isMe = newValue;
  //   ChangeNotifier();
  // }

  // //Get user model from id
  // List<Map<String, dynamic>> getSingelUserFromUserModel(int id) {
  //   DatabaseService.instance.getUserModelFromId(id).then((value) => {
  //         singelUserModel.add(value[0]),
  //         print(value[0]),
  //       });
  //   return singelUserModel;
  // }

  // // get message or chat between logged user and other user
  // Future<List<Map<String, dynamic>>> getChatMessage() {
  //   String senderEmail = getSingelUserFromUserModel(senderId)[0]['email'];
  //   print(senderEmail);
  //   String receiverEmail = getSingelUserFromUserModel(receiverId)[0]['email'];
  //   return DatabaseService.instance.getMessage(senderEmail, receiverEmail);
  // }

  // // Image picker
  // var image;
  // Future getImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;

  //   final imageTemporary = image.path;
  //   this.image = imageTemporary;
  //   // sendMessage(loggedUserEmail, anotherUserEmail);
  //   // (ChatProvider().isMe == true)
  //   //     ? sendMessage(loggedUserEmail, anotherUserEmail, "", _image)
  //   //     : sendMessage(anotherUserEmail, loggedUserEmail, "", _image);
  // }

  // // clear selected image
  // void clearSelectedImage() {
  //   this.image = null;
  // }

  // // Send Message when send button is pressed
  // void sendMessage(String loggedUserEmail, String anotherUserEmail,
  //     [String message = "", String? image]) async {
  //   ChatModel chatModel = ChatModel(
  //       senderEmail: loggedUserEmail,
  //       receiverEmail: anotherUserEmail,
  //       message: message,
  //       imageMessage: image,
  //       datetime: DateTime.now().toIso8601String());
  //   DatabaseService.instance.addMessage(chatModel);
  //   messageController.clear();
  //   clearSelectedImage();
  // }

  // // Change user on swap button pressed
  // void ChangeUser() {
  //   isMe = !isMe;
  //   notifyListeners();
  // }
}
