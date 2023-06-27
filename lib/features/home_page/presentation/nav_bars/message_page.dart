// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_chat_app/features/home_page/presentation/tab_bars/calls_tab.dart';
import 'package:new_chat_app/features/home_page/presentation/tab_bars/group_tab.dart';
import 'package:new_chat_app/features/home_page/presentation/tab_bars/message_tab.dart';

class MessagePage extends StatelessWidget {
  final String userEmail;
  MessagePage({
    Key? key,
    required this.userEmail,
  }) : super(key: key);
  final blackText = TextStyle(color: Colors.black);

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
                // BlueDotWidget(),
              ],
            ),
            Tab(icon: Text("Group", style: blackText)),
            Tab(icon: Text("Calls", style: blackText))
          ],
        ),
      ),
      body: TabBarView(
        children: [
          MessageTab(userEmail: userEmail),
          GroupTab(),
          CallsTab(),
        ],
      ),
    );
  }
}
