import 'package:chat_app/views/pages/NavBar/message_page.dart';
import 'package:chat_app/views/pages/NavBar/setting_page.dart';
import 'package:chat_app/views/pages/NavBar/user_list_page.dart';
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
  final pages = [const UserListPage(), MessagePage(), const SettingPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          unselectedItemColor: Colors.black87,
          backgroundColor: Theme.of(context).primaryColorLight,
          selectedIconTheme: IconThemeData(color: Colors.blue.shade600),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "1"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: "'2"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_accessibility_rounded), label: "3")
          ]),
      body: pages[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
