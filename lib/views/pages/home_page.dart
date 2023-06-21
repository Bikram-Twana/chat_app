// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:chat_app/data/user_profile.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/views/others/bottom_navbar_widget.dart';
import 'package:chat_app/views/pages/TabBar/calls_tab.dart';
import 'package:chat_app/views/pages/TabBar/group_tab.dart';

class HomePage extends StatelessWidget {
  final String userEmail;
  HomePage({
    Key? key,
    required this.userEmail,
  }) : super(key: key);
  final tabPages = [const GroupTab(), const CallsTab()];
  final blackText = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomNavBarWidget(userEmail: '$userEmail'),
        ),
      ),
    );
  }
}
