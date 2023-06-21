// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/utils/consts/blue_dot_widget.dart';
import 'package:chat_app/views/pages/TabBar/calls_tab.dart';
import 'package:chat_app/views/pages/TabBar/group_tab.dart';
import 'package:chat_app/views/pages/TabBar/message_tab.dart';

class MessagePage extends StatelessWidget {
  String userEmail;
  MessagePage({
    Key? key,
    required this.userEmail,
  }) : super(key: key);
  final blackText = TextStyle(color: Colors.black);

  // set setEmail(String userEmail) {
  //   this.userEmail = userEmail;
  // }

  // String get userEmail => userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Chat", style: blackText),
        actions: [
          Row(
            children: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.person_add_sharp),
                onPressed: () {},
              ),
            ],
          ),
        ],
        backgroundColor: Color(0xFFEDF0F6),
        bottom: TabBar(
          tabs: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tab(icon: Text("Message", style: blackText)),
                BlueDotWidget(),
              ],
            ),
            Tab(icon: Text("Group", style: blackText)),
            Tab(icon: Text("Calls", style: blackText))
          ],
        ),
      ),
      body: TabBarView(
        children: [
          MessageTab(userEmail: '$userEmail'),
          GroupTab(),
          CallsTab(),
        ],
      ),
    );
  }
}
