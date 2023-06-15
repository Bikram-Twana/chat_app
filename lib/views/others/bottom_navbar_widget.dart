import 'package:chat_app/views/pages/message_page.dart';
import 'package:chat_app/views/pages/setting_page.dart';
import 'package:chat_app/views/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 1;
  final pages = [
    const UserListPage(),
    const MessagePage(),
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility_rounded),
          )
        ]);
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
