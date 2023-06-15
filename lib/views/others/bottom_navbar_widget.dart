import 'package:chat_app/views/pages/NavBar/message_page.dart';
import 'package:chat_app/views/pages/NavBar/setting_page.dart';
import 'package:chat_app/views/pages/NavBar/user_list_page.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

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
