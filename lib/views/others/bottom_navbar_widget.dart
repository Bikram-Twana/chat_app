// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/views/pages/NavBar/message_page.dart';
import 'package:chat_app/views/pages/NavBar/setting_page.dart';
import 'package:chat_app/views/pages/NavBar/user_list_page.dart';

class BottomNavBarWidget extends StatefulWidget {
  final String userEmail;
  BottomNavBarWidget({
    Key? key,
    required this.userEmail,
  }) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  // initState() {
  //   super.initState();
  //   MessagePage().setEmail = widget.userEmail;
  // }
  // get userEmail => widget.userEmail;

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const UserListPage(),
      MessagePage(
        userEmail: '${widget.userEmail}',
      ),
      const SettingPage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          unselectedItemColor: Colors.black87,
          backgroundColor: Theme.of(context).primaryColorLight,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedIconTheme: IconThemeData(color: Colors.blue.shade600),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.messenger), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ]),
      body: pages[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
