// import 'package:chat_app/data/user_profile.dart';
import 'package:chat_app/views/others/bottom_navbar_widget.dart';
import 'package:chat_app/views/pages/TabBar/calls_tab.dart';
import 'package:chat_app/views/pages/TabBar/group_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final tabPages = [const GroupTab(), const CallsTab()];
  final blackText = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: BottomNavBarWidget(),
          ),
        ),
      ),
    );
  }
}
