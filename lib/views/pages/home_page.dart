// import 'package:chat_app/data/user_profile.dart';
import 'package:chat_app/utils/consts/blue_dot_widget.dart';
import 'package:chat_app/views/others/bottom_navbar_widget.dart';
import 'package:chat_app/views/pages/TabBar/calls_tab.dart';
import 'package:chat_app/views/pages/TabBar/group_tab.dart';
import 'package:chat_app/views/pages/NavBar/message_page.dart';
// import 'package:chat_app/views/pages/message_page.dart';
// import 'package:chat_app/views/pages/setting_page.dart';
// import 'package:chat_app/views/pages/user_list_page.dart';
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     "All Chat",
          //     style: blackText,
          //   ),
          //   actions: [
          //     Row(
          //       children: [
          //         IconButton(
          //           color: Colors.black,
          //           icon: Icon(
          //             Icons.search,
          //           ),
          //           onPressed: () {},
          //         ),
          //         IconButton(
          //           color: Colors.black,
          //           icon: Icon(Icons.verified_user_sharp),
          //           onPressed: () {},
          //         ),
          //       ],
          //     )
          //   ],
          //   backgroundColor: Color(0xFFEDF0F6),
          //   bottom: TabBar(
          //     // indicator: BoxDecoration(color: Colors.black),
          //     // labelStyle: TextStyle(color: Colors.black, background: Paint()),
          //     tabs: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Tab(icon: Text("Message", style: blackText)),
          //           BlueDotWidget(),
          //         ],
          //       ),
          //       Tab(
          //         icon: Text("Group", style: blackText),
          //       ),
          //       Tab(
          //         icon: Text("Calls", style: blackText),
          //       )
          //     ],
          //   ),
          // ),

          // body: TabBarView(
          //   children: [
          //     // Container(child: Center(child: Text('Message'))),
          //     MessagePage(),
          //     GroupTab(),
          //     CallsTab(),
          //   ],
          // ),
          bottomNavigationBar: BottomNavBarWidget(),
        ),
      ),
    );
  }
}
