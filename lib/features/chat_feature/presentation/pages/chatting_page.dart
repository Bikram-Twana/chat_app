// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:new_chat_app/features/chat_feature/presentation/controllers/chatting_provider.dart';
import 'package:new_chat_app/utils/consts/chat_bubble.dart';

class ChattingPage extends StatefulWidget {
  ChattingPage({
    Key? key,
    required this.anotherUserFullName,
    required this.anotherUserEmail,
    required this.loggedUserEmail,
  }) : super(key: key);
  final String anotherUserFullName;
  final String anotherUserEmail;
  final String loggedUserEmail;

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  // // image picker
  // String? _image;
  // Future getImage(String loggedUserEmail, String anotherUserEmail,
  //     [String message = "", String? image]) async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;

  //   String imageTemporary = image.path;

  //   setState(() {
  //     _image = imageTemporary;
  //   });
  //   // sendMessage(loggedUserEmail, anotherUserEmail);
  //   // (ChatProvider().isMe == true)
  //   //     ? sendMessage(loggedUserEmail, anotherUserEmail, "", _image)
  //   //     : sendMessage(anotherUserEmail, loggedUserEmail, "", _image);
  // }

  // // clear selected image
  // void clearSelectedImage() {
  //   this._image = null;
  // }

  // void sendMessage(String loggedUserEmail, String anotherUserEmail,
  //     [String message = "", String? image]) async {
  //   // if (message.isNotEmpty) {
  //   // log(anotherUserEmail);
  //   ChatModel chatModel = ChatModel(
  //       senderEmail: loggedUserEmail,
  //       receiverEmail: anotherUserEmail,
  //       message: message,
  //       image: _image,
  //       datetime: DateTime.now().toIso8601String());
  //   Provider.of<ChatProvider>(context, listen: false).sendMessage(chatModel);
  //   // clear the text controller after sending the message
  //   _messageController.clear();
  //   clearSelectedImage();
  // }

  @override
  Widget build(BuildContext context) {
    ChattingProvider chattingProvider = context.read<ChattingProvider>();
    String loggedUserEmail = widget.loggedUserEmail;
    String anotherFullName = widget.anotherUserFullName;
    String anotherUserEmail = widget.anotherUserEmail;

    chattingProvider.senderEmail = loggedUserEmail;
    chattingProvider.receiverEmail = anotherUserEmail;

    // String? _image = context.read<chattingProvider>().image;

    bool isMe = Provider.of<ChattingProvider>(context, listen: true).isMe;

    // Map<String, dynamic> singelChatModel = chatmodel![0];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("${anotherFullName}"),
            Text(
              "Active Now",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Column(
          children: [
            // Displaying fetched message list from previous chats
            Expanded(
              child: _buildMessageList(loggedUserEmail),
            ),
            // Message input from textEditingController
            _buildMessageInput(
                loggedUserEmail, anotherUserEmail, isMe, chattingProvider),
          ],
        ),
      ),
    );
  }

  //build message list
  Widget _buildMessageList(String senderEmailFromLogin) {
    return FutureBuilder(
      future: context.watch<ChattingProvider>().getChatMessage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        if (snapshot.data == null) {
          return Text("No Message");
        }

        return snapshot.hasData
            ? ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  // log(snapshot.data.toString());
                  final isLoggedUser = (snapshot.data![i]["senderEmail"] ==
                      senderEmailFromLogin);
                  Map<String, dynamic> chat = snapshot.data![i];
                  return _buildMessageItem(chat, isLoggedUser);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  // build message item
  Widget _buildMessageItem(Map<String, dynamic> data, bool isLoggedUser) {
    var alignment = isLoggedUser
        // (data["senderEmail"] == loggedEmail)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (data["image"] != null)
              ? Container(
                  padding: EdgeInsets.all(4),
                  child: Image.file(
                    File(data["image"]),
                    width: 120,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                )
              : ChatBubble(message: data["message"], isMe: isLoggedUser),
        ],
      ),
    );
  }

  // build message input
  Widget _buildMessageInput(String loggedUserEmail, String anotherUserEmail,
      bool isMe, ChattingProvider chattingProvider) {
    String? _image;
    TextEditingController messageController =
        chattingProvider.messageController;
    return Row(
      children: [
        // add media button
        CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.blue.shade400,
            onPressed: () {
              chattingProvider.getImage().then((value) => _image = value);
            },
          ),
        ),
        SizedBox(width: 4),
        //textfield
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Colors.grey[200],
              filled: true,
              hintText: 'Enter Message',
              hintStyle: TextStyle(color: Colors.grey),
            ),
            controller: messageController,
            minLines: 1,
            maxLines: 5,
            obscureText: false,
          ),
        ),
        // send button
        IconButton(
            onPressed: () {
              // sendMessage(anotherUserEmail, , )
              chattingProvider.ChangeUser();
            },
            icon: Icon(
              Icons.swap_vert,
              color: Colors.grey[800],
            )),
        IconButton(
            onPressed: () {
              setState(() {});

              // findChatModelFromEmail(loggedUserEmail);
              if (isMe) {
                _image != null
                    ? chattingProvider.sendMessage(
                        loggedUserEmail, anotherUserEmail, "", _image)
                    : chattingProvider.sendMessage(loggedUserEmail,
                        anotherUserEmail, messageController.text);
              } else {
                _image != null
                    ? chattingProvider.sendMessage(
                        anotherUserEmail, loggedUserEmail, "", _image)
                    : chattingProvider.sendMessage(anotherUserEmail,
                        loggedUserEmail, messageController.text);
              }
            },
            icon: Icon(Icons.arrow_upward)),
      ],
    );
  }
}
