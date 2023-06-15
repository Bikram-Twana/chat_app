import 'package:chat_app/data/user_profile.dart';
import 'package:chat_app/views/others/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      appBar: AppBar(
        title: Text("All Chat"),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.verified_user_outlined),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 100.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allProfileImages.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 100);
                  }
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(allProfileImages[index]),
                    ),
                  );
                }),
          ),
          Expanded(
            child: SingleChildScrollView(
                // child: ,
                ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
