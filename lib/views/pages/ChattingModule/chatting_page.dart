// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_app/models/providers/chat_provider.dart';
import 'package:chat_app/models/user/chat_model.dart';
import 'package:chat_app/utils/consts/chat_bubble.dart';

class ChattingPage extends StatefulWidget {
  final String loggedUserEmail;
  final String anotherUserFullName;
  final String anotherUserName;

  // get loggedUser => loggedUserEmail;
  // set loggerUser(String loggedUser) {
  //   _loggedUserEmail = loggedUser;
  // }

  ChattingPage({
    Key? key,
    required this.loggedUserEmail,
    required this.anotherUserFullName,
    required this.anotherUserName,
  }) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final TextEditingController _messageController = TextEditingController();

  List<Map<String, dynamic>>? chatmodel;

  void findChatModelFromEmail(String userEmail) {
    Provider.of<ChatProvider>(context, listen: false)
        .getSingleChatModelFromEmail(userEmail)
        .then((value) => value.forEach((e) => chatmodel!.add(e)));
  }

  void sendMessage(
      String loggedUserName, String anotherUserName, String message) async {
    if (message.isNotEmpty) {
      String loggedUserEmail = widget.loggedUserEmail;
      //
      ChatModel chatModel = ChatModel(
          email: loggedUserEmail,
          sender: loggedUserName,
          receiver: anotherUserName,
          message: message,
          datetime: DateTime.now().toIso8601String());
      Provider.of<ChatProvider>(context, listen: false).sendMessage(chatModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    String loggedUserEmail = widget.loggedUserEmail;
    String anotherUserName = widget.anotherUserName;
    Map<String, dynamic> singelChatModel = chatmodel![0];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("${widget.anotherUserName}"),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: ChatBubble(message: 'message1'),
                  );
                }),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: Icon(
                  Icons.add,
                  color: Colors.blue.shade400,
                ),
              ),
              SizedBox(width: 4),
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
                controller: _messageController,
                minLines: 1,
                maxLines: 5,
                obscureText: false,
              )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.swap_vert,
                    color: Colors.grey[800],
                  )),
              IconButton(
                  onPressed: () {
                    findChatModelFromEmail(loggedUserEmail);
                    sendMessage(singelChatModel["userName"], anotherUserName,
                        _messageController.text);
                  },
                  icon: Icon(Icons.arrow_upward)),
            ],
          ),
        ],
      ),
    );
  }
}
