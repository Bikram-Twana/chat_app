import 'package:chat_app/data/user_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessageTab extends StatelessWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Stories Profile
          Container(
            width: double.maxFinite,
            height: 100.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allProfileImages.length - 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 10.0);
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
    );
  }
}
