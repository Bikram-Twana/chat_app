import 'package:chat_app/utils/consts/blue_dot_widget.dart';
import 'package:chat_app/views/pages/TabBar/calls_tab.dart';
import 'package:chat_app/views/pages/TabBar/group_tab.dart';
import 'package:chat_app/views/pages/TabBar/message_tab.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key});
  // final tabPages = [MessageTab(), const GroupTab(), const CallsTab()];
  final blackText = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Chat",
          style: blackText,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                color: Colors.black,
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.verified_user_sharp),
                onPressed: () {},
              ),
            ],
          )
        ],
        backgroundColor: Color(0xFFEDF0F6),
        bottom: TabBar(
          // indicator: BoxDecoration(color: Colors.black),
          // labelStyle: TextStyle(color: Colors.black, background: Paint()),
          tabs: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tab(icon: Text("Message", style: blackText)),
                BlueDotWidget(),
              ],
            ),
            Tab(
              icon: Text("Group", style: blackText),
            ),
            Tab(
              icon: Text("Calls", style: blackText),
            )
          ],
        ),
      ),
      body: TabBarView(
        children: [
          MessageTab(),
          GroupTab(),
          CallsTab(),
        ],
      ),
    );
  }
}
