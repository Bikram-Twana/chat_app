import 'package:chat_app/data/user_profile.dart';
import 'package:flutter/material.dart';

class MessageTab extends StatelessWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context) {
    final fullSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          //Stories Profile
          Row(
            children: [
              //Add Your Story
              Column(
                children: [
                  Container(
                    height: 50.0,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                    child: ClipOval(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text("Your Story"),
                ],
              ),
              Container(
                width: fullSize.width - 65,
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allProfileImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container();
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(allProfileImages[index]),
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text('Story'),
                        ],
                      );
                    }),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.green),
                    title: Text("MyName"),
                    subtitle: Text("This is a message"),
                    trailing: Column(
                      children: [
                        Text("3m ago"),
                        Text("Typing..."),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
