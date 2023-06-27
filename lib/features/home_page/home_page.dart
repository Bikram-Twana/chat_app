import 'package:flutter/material.dart';
import 'package:new_chat_app/features/home_page/presentation/controllers/home_provider.dart';
import 'package:new_chat_app/features/home_page/presentation/nav_bars/message_page.dart';
import 'package:new_chat_app/features/home_page/presentation/nav_bars/setting_page.dart';
import 'package:new_chat_app/features/home_page/presentation/nav_bars/user_list_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String userEmail;
  HomePage({
    Key? key,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.read<HomeProvider>();
    int _index = homeProvider.index;
    homeProvider.setSenderEmail = userEmail;
    final pages = [
      const UserListPage(),
      MessagePage(userEmail: userEmail),
      const SettingPage()
    ];

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 10.0,
              unselectedItemColor: Colors.black87,
              backgroundColor: Theme.of(context).primaryColorLight,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              selectedIconTheme: IconThemeData(color: Colors.blue.shade600),
              currentIndex: _index,
              onTap: (index) {
                homeProvider.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.messenger), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
              ]),
          body: pages[_index],
        ),
      ),
    );
  }
}
